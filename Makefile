include ./srcs/.env

SRCS	:= ./srcs/docker-compose.yml
						
# Start all containers found in docker-compose.yml
all : prepare build

build:
	docker-compose -f $(SRCS) up
# mkdir -parents: creates the directory and, if required, all parent directories. 
prepare:
	sudo mkdir -p $(MARIADB_VOLUME)
	sudo mkdir -p $(WORDPRESS_VOLUME)
# sudo chmod 777 /etc/hosts
# echo "127.0.0.1 " $(DOMAIN_NAME) >> /etc/hosts

# Stop all containers found in docker-compose.yml, and remove docker network between them
stop:
	docker-compose -f $(SRCS) down
# go through all containers and stop them, also stop the network

# Stop container and remove files created
# https://www.educba.com/docker-system-prune/
clean:
	docker system prune -a
	sudo rm -rf /home/thi-nguy/data

.PHONY : all build prepare stop clean