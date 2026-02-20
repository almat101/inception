all :	create-dirs up

up :
		docker compose -f srcs/docker-compose.yml up --build
down :
		docker compose -f srcs/docker-compose.yml down

clean :
		sudo docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		sudo rm -rf /home/${USER}/data/wordpress/*
		sudo rm -rf /home/${USER}/data/mariadb/*
		sudo rm -rf /home/${USER}/data/adminer/*

re :
		docker compose -f srcs/docker-compose.yml down
		docker compose -f srcs/docker-compose.yml up --build

stop :
		docker compose -f srcs/docker-compose.yml stop

start :
		docker compose -f srcs/docker-compose.yml start

ps :
		docker compose -f srcs/docker-compose.yml ps --all

images :
		docker compose -f srcs/docker-compose.yml images

exec :
		docker exec -it $(C) /bin/sh || true

logs :
		docker logs $(C)

prune :
		docker system prune -af

list-all :
		docker ps -a

list-all-id :
		docker ps -a -q

redis-cli :
		docker exec -it redis redis-cli

create-dirs:
		@echo "Creating directories"
		mkdir -p /home/${USER}/data/wordpress
		mkdir -p /home/${USER}/data/mariadb
		mkdir -p /home/${USER}/data/adminer
