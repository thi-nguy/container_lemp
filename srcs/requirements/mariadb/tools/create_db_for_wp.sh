#!/bin/sh

# Establish mysqld (is the server executable)

if [ -d "/run/mysqld" ]; then
	echo "mysqld is already here, doing nothing."
	chown -R mysql:mysql /run/mysqld
else
	echo "mysqld not found, creating /run/mysqld...."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql

	# initialize database: https://mariadb.com/kb/en/mysql_install_db/
	# initializes the MariaDB data directory and creates the system tables in the mysql database, 
	# if they do not exis
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	# This make temp file, append below lines to temp file, Then use that as .sql file
	temp_file=`mktemp`
	if [ ! -f "$temp_file" ]; then
		return 1
	fi
	cat << EOF > $temp_file
USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;

CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED by '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';

FLUSH PRIVILEGES;
EOF
	# run temp_file: start mysql server, configure it by using temp_file
	/usr/bin/mysqld --user=mysql --bootstrap < $temp_file

	# remove temp_file
	rm -f $temp_file
fi

# https://stackoverflow.com/questions/11657829/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run
# Allow other container connect to mysql with that ip address.
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
