FROM debian:buster 

RUN apt-get -y update 
RUN apt-get -y upgrade 

RUN apt-get -y install mariadb-server mariadb-client

# Todo: Co can check no enable ko?
# ! systemctl is-enabled mariadb


# Todo: Co can check no enable ko?
# ! systemctl is-enabled php7.4-fpm
RUN apt-get -y update 
RUN apt-get -y upgrade

RUN mkdir -p /var/lib/mysql/
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./create_db_for_wp.sh /
# RUN bash ./create_db_for_wp.sh

EXPOSE 3306

# run the server
CMD ["bash", "create_db_for_wp.sh"]



# ! Since PHP 7.4 is the default version of PHP in Ubuntu 20.04, the PHP configuration files are located in /etc/php/7.4/ and the PHP-FPM configuration files are stored under /etc/php/7.4/fpm.

# Todo: Sau do chay file .sh de cai dat username cho mariadb

# Todo: Unintall mariadb
# sudo apt-get purge mariadb-server mariadb-client-*

# ! To open mariadb client
# sudo mysql -u root -p 