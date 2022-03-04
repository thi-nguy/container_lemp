FROM debian:buster 

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y \
	 php7-fpm php7-opcache php7-mysqli \
	php7-gd php7-zlib php7-curl php7-iconv \
	php7-mbstring php7-cli php7-json php7-phar \
	php7-common php7-session php7-xml php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7-simplexml php7-pecl-mailparse

RUN apt-get -y install wget && apt-get -y install unzip

#user:group in debian is www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html 

# https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a
RUN userdel -f www-data && useradd -u 82 www-data

RUN mkdir -p /my_scripts
COPY ./tools/install_wp.sh /my_scripts/install_wp.sh

RUN apt-get install -y mariadb-client
RUN apt-get install -y mysql-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/ 
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/

# ! Install wp-cli, using it to build, configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/my_scripts/install_wp.sh"]