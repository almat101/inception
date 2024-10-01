FROM alpine:3.19

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx sudo vim openssl

RUN rm -f /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN chown -R www-data:www-data /var/www/html idk if this is needed
COPY tools/entrypoint.sh etc/nginx/entrypoint.sh

RUN chmod +x etc/nginx/entrypoint.sh

EXPOSE 443

CMD ["etc/nginx/entrypoint.sh"]
