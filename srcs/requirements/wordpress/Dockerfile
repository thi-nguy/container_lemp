FROM debian:buster 

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y \
	php7.3 \
	php7.3-mysql \
	php7.3-fpm \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-xml \
	php7.3-xmlrpc \
	php7.3-zip

RUN apt-get -y install wget && apt-get -y install unzip

#user:group in debian is www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html 

# https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a
RUN userdel -f www-data && useradd -u 82 www-data

RUN mkdir -p /my_scripts
COPY ./tools/install_wp.sh /my_scripts/install_wp.sh

RUN apt-get install -y mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/ 
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/

# ! Install wp-cli, using it to build, configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/my_scripts/install_wp.sh"]