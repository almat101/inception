all :	create-dirs up

up :
		sudo docker compose -f srcs/docker-compose.yml up --build
down :
		sudo docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

down-clean-v-data :
		sudo docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		sudo rm -rf /home/ale/data/wordpress/*
		sudo rm -rf /home/ale/data/mariadb/*
		sudo rm -rf /home/ale/data/adminer/*
#		sudo rm -rf /home/amatta/data/wordpress/*
#		sudo rm -rf /home/amatta/data/mariadb/*
#	    sudo rm -rf /home/amatta/data/adminer/*

re :
		sudo docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		sudo docker compose -f srcs/docker-compose.yml up --build

stop :
		sudo docker compose -f srcs/docker-compose.yml stop

start :
		sudo docker compose -f srcs/docker-compose.yml start

restart:
		sudo docker compose -f srcs/docker-compose.yml restart

ps :
		sudo docker compose -f srcs/docker-compose.yml ps --all

images :
		sudo docker compose -f srcs/docker-compose.yml images

exec :
		sudo docker exec -it $(C) /bin/bash || true

logs :
		sudo docker logs $(C)

prune :
		sudo docker system prune -af

list-all :
		sudo docker ps -a

list-all-id :
		sudo docker ps -a -q

redis-cli :
		sudo docker exec -it redis redis-cli

create-dirs:
		@echo "Creating directories"
		mkdir -p /home/ale/data/wordpress
		mkdir -p /home/ale/data/mariadb
		mkdir -p /home/ale/data/adminer
