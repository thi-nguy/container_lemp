#!/bin/bash

chown -R www-data:www-data .
while ! mariadb -h$DB_HOST -u$DB_USER -p$DB_PASSWORD &>/dev/null; do
	echo "waiting for $DB_HOST ..."
	sleep 2
done

exec php-fpm7.3 -F