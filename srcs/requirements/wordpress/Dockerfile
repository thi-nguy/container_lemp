# base image: debina: et debina installed inside the nginx image
# con cai TLS1.2 TLS1.3?

# Download debina
FROM debian:buster 

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install unzip

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

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

# RUN adduser -D -g 'www-data' www-data
RUN mkdir -p /scripts
COPY install_wp.sh /scripts/install_wp.sh
#source-host : destination-container

# # COPY wp-config.php /var/www/html/wordpress # ! buoc  nay khong copy duoc?
COPY www.conf /etc/php/7.3/fpm/pool.d/ 
COPY php-fpm.conf /etc/php/7.3/fpm/

    # ! Install wp-cli and install wordpress by wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/html/wordpress

EXPOSE 9000

#Run the server
ENTRYPOINT ["bash", "/scripts/install_wp.sh"]

