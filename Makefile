include ./srcs/.env

SRCS	:= ./srcs/docker-compose.yml
						
# Start all containers found in docker-compose.yml
all : prepare build

build:
	docker-compose -f $(SRCS) up -d
# --build -d
# mkdir -parents: creates the directory and, if required, all parent directories. 
prepare:
	sudo mkdir /home/thi-nguy/data
	sudo mkdir /home/thi-nguy/data/wp
	sudo mkdir /home/thi-nguy/data/mysql
# sudo mkdir -p $(MARIADB_VOLUME)
# sudo userdel -f mysql
# sudo useradd -u 999 mysql
# sudo chown -R mysql:mysql $(MARIADB_VOLUME)
# sudo mkdir -p $(WORDPRESS_VOLUME)
# sudo userdel -f www-data
# sudo useradd -u 82 www-data
# sudo chown -R www-data:www-data $(WORDPRESS_VOLUME)
# sudo chmod 777 /etc/hosts
# echo "127.0.0.1 " $(DOMAIN_NAME) >> /etc/hosts

# Stop all containers found in docker-compose.yml, and remove docker network between them
stop:
	docker-compose -f $(SRCS) down
# go through all containers and stop them, also stop the network

# Stop container and remove files created
# https://www.educba.com/docker-system-prune/
clean: stop
	docker system prune -a
# docker rm $(docker ps -qa)
# docker rmi -f $(docker images -qa)
# docker volume rm $(docker volume ls -q)
# docker network rm $(docker network ls -q) 2>/dev/null
	sudo rm -rf /home/thi-nguy/data

re: clean all

.PHONY : all build prepare stop clean