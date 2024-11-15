FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx sudo vim openssl

RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/*
RUN rm -rf /etc/nginx/sites-available/*
RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

#this is crucial to avoid 403 on ngnix
RUN chown -R www-data:www-data /var/www/html

COPY tools/script_n.sh /usr/local/bin/script_n.sh

RUN chmod +x /usr/local/bin/script_n.sh

#give the right permissions to the html folder
RUN chmod 755 /var/www/html

CMD ["/usr/local/bin/script_n.sh"]
