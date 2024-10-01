all :
		docker-compose -f srcs/docker-compose.yml up --build

down :
		docker-compose -f srcs/docker-compose.yml down -v --rmi all

stop :
		docker-compose -f srcs/docker-compose.yml stop

start :
		docker-compose -f srcs/docker-compose.yml start
