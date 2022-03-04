#!/bin/sh

# mkdir -p: (p=parent) creates the directory and, if required, all parent directories. 
if [ -d "/home/thi-nguy/data" ]; then
	echo "/home/thi-nguy/data is already here, do nothing."
else
	echo "/home/thi-nguy/data not found, creating it..."
    # need to create folder step by step because of problem at finding the path in named volume
	sudo mkdir /home/thi-nguy/data
	sudo mkdir /home/thi-nguy/data/wp
	sudo mkdir /home/thi-nguy/data/mysql
fi

# Change configure to /etc/hosts: to make local IP address points to my domain name (thi-nguy.42.fr)
sudo chmod 777 /etc/hosts
echo "127.0.0.1 thi-nguy.42.fr" >> /etc/hosts