FROM alpine:3.19

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx sudo vim openssl

RUN rm -f /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
# Create a self-signed SSL certificate then move to a script.sh
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=amatta.42.fr/UID=amatta"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# execute ngnix in the foreground this is useful for debugging
CMD ["nginx", "-g", "daemon off;"]
