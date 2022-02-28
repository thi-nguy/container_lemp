# if [ -d "/run/bin/mysqld" ]; then
# 	echo "[i] mysqld already present, skipping creation"
# 	chown -R www-data:www-data /run/bin/
# 	mysqld
# else
# 	echo "[i] mysqld not found, creating...."
# 	mkdir -p /run/bin/mysqld
# 	chown -R www-data:www-data /run/bin/mysqld
# fi

service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;"

mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}'); DROP DATABASE IF EXISTS test; FLUSH PRIVILEGES; "

mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"

mysql -u root -e "USE $MYSQL_DATABASE; GRANT ALL PRIVILEGES ON * TO '$MYSQL_USER'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

mysql -u root -e "INSERT INTO $MYSQL_DATABASE.wp_users (user_login,user_pass,user_nicename,user_email,user_url,user_registered,user_activation_key,user_status,display_name) VALUES ('thi-nguy',MD5('thi-nguy'),'','thi-nguy@example.com','https://thi-nguy.42.fr','','',0,'');"


# ! Problem here
# https://stackoverflow.com/questions/11657829/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run

# This does not work
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

# mysql -h 127.0.0.1 -P 3306 -u root -p $MYSQL_DATABASE
exec mysqld && mariadb



