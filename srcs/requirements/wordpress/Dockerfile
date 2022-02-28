# base image: debina: et debina installed inside the nginx image
# con cai TLS1.2 TLS1.3?

# Download debina
FROM debian:buster 

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install unzip

# Todo: Download and unzip wordpress
RUN wget https://wordpress.org/latest.zip --no-check-certificate
RUN unzip latest.zip
RUN rm -rf latest.zip

# Todo: Copy folder wordpress to /var/www/mysite
    # ! Make a new folder call mysite
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mv wordpress /var/www/html/ # ! buoc  nay khong copy duoc?


RUN apt-get -y install php php-mysql php-fpm
#source destination
# COPY wp-config.php /var/www/mysite/wordpress/ 
COPY www.conf /etc/php/7.3/fpm/pool.d/
COPY php-fpm.conf /etc/php/7.3/fpm/

    # ! Install wp-cli and install wordpress by wp-cli
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --no-check-certificate

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./install_wp.sh /
# RUN bash ./install_wp.sh
# RUN cd /var/www/mysite/wordpress
# RUN php-fpm7.4 --nodaemonize
# RUN wp core install --url=https://thi-nguy.42.fr --title=NhungSite --admin_user=nhungNguyen --admin_password=secret --admin_email=nhungNguyen@example.com

EXPOSE 9000

#Run the server
CMD ["bash", "install_wp.sh"]

