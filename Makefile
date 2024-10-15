all :
		docker compose -f srcs/docker-compose.yml up --build

down :
		docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

down-clean-v-data :
		docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		sudo rm -rf /home/${USER}/data/wordpress/*
		sudo rm -rf /home/${USER}/data/mariadb/*

re :
		docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		docker compose -f srcs/docker-compose.yml up --build

stop :
		docker compose -f srcs/docker-compose.yml stop

start :
		docker compose -f srcs/docker-compose.yml start

restart:
		docker compose -f srcs/docker-compose.yml restart

ps :
		docker compose -f srcs/docker-compose.yml ps --all

images :
		docker compose -f srcs/docker-compose.yml images

exec :
		docker exec -it $(C) /bin/bash || true

logs :
		docker logs $(C)

prune :
		docker system prune -af

list-all :
		docker ps -a

list-all-id :
		docker ps -a -q



