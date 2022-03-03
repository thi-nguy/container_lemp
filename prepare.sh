#!/bin/sh

if [ -d "/home/thi-nguy/data" ]; then
	echo "/home/thi-nguy/data not found, creating it..."
    sudo mkdir /home/thi-nguy/data
	sudo mkdir /home/thi-nguy/data/wp
	sudo mkdir /home/thi-nguy/data/mysql
else
	echo "/home/thi-nguy/data is already here, do nothing"
fi

sudo chmod 777 /etc/hosts
echo "127.0.0.1 thi-nguy.42.fr" >> /etc/hosts