all :
		docker-compose -f srcs/docker-compose.yml up --build

down :
		docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

re :
		docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		docker-compose -f srcs/docker-compose.yml up --build

stop :
		docker-compose -f srcs/docker-compose.yml stop

start :
		docker-compose -f srcs/docker-compose.yml start

ps :
		docker-compose -f srcs/docker-compose.yml ps --all

images :
		docker-compose -f srcs/docker-compose.yml images

exec :
		docker exec -it $(C) /bin/bash || true

logs :
		docker logs $(C)

prune :
		docker system prune -af

