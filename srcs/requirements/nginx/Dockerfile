FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx sudo vim openssl

RUN rm -f /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

#this is crucial to avoid 403 on ngnix
RUN chown -R www-data:www-data /var/www/html

COPY tools/script_n.sh etc/nginx/script_n.sh

RUN chmod +x etc/nginx/script_n.sh

#give the right permissions to the html folder
RUN chmod 755 /var/www/html

CMD ["etc/nginx/script_n.sh"]
