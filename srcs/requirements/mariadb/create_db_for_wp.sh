service mysql start
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -e "USE $MYSQL_DATABASE; GRANT ALL PRIVILEGES ON * TO '$MYSQL_USER'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -e "INSERT INTO $MYSQL_DATABASE.wp_users (user_login,user_pass,user_nicename,user_email,user_url,user_registered,user_activation_key,user_status,display_name) VALUES ('thi-nguy',MD5('thi-nguy'),'','thi-nguy@example.com','https://thi-nguy.42.fr','','',0,'');"

service mysqld start

