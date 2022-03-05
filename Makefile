include ./srcs/.env

SRCS	:= ./srcs/docker-compose.yml
						
# Start all containers found in docker-compose.yml
all : prepare build

# -d: detached mode
build:
	docker-compose -f $(SRCS) up -d

# prepare database at host machine and configure etc/hosts	
prepare:
	bash prepare.sh

# Stop all containers found in docker-compose.yml, and remove docker network between them
# go through all containers and stop them, also stop the network
stop:
	docker-compose -f $(SRCS) down

# Stop container and remove files created
# https://www.educba.com/docker-system-prune/
clean-docker: stop
	docker system prune -a

# Remove database on host machine
clean-volume: 
	sudo rm -rf /home/thi-nguy/data

reboot: clean-docker all
	
re: clean-docker clean-volume all

.PHONY : all build prepare stop clean-docker clean-volume reboot
