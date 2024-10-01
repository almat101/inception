all :
		docker-compose -f srcs/docker-compose.yml up --build

down :
		docker-compose -f srcs/docker-compose.yml down -v --rmi all

stop :
		docker-compose -f srcs/docker-compose.yml stop

start :
		docker-compose -f srcs/docker-compose.yml start

ps :
		docker-compose -f srcs/docker-compose.yml ps --all

images :
		docker-compose -f srcs/docker-compose.yml images

exec nginx:
		docker exec -it nginx /bin/sh
