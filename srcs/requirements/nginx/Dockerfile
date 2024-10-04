# FROM alpine:3.19

# RUN apk update && \
# 	apk upgrade && \
# 	apk add --no-cache nginx sudo vim openssl

FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx sudo vim openssl

RUN rm -f /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

#this is crucial to avoid 403 on ngnix
RUN chown -R www-data:www-data /var/www/html

COPY tools/entrypoint.sh etc/nginx/entrypoint.sh

RUN chmod +x etc/nginx/entrypoint.sh

# expose port 443 to other containers in the same docker network
# in this case is useless because we use ports in the docker-compose to map the ports 443 of the container to the 443 of the host machine
# EXPOSE 443

#give the right permissions to the html folder
RUN chmod 755 /var/www/html

CMD ["etc/nginx/entrypoint.sh"]
