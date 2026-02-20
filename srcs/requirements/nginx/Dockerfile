FROM alpine:3.22

RUN apk update && apk add nginx openssl curl iproute2 vim

RUN mkdir -p /etc/nginx/ssl

COPY conf /etc/nginx

COPY tools /usr/local/bin

RUN chmod +x /usr/local/bin/script_n.sh

ENTRYPOINT ["script_n.sh"]

CMD ["nginx", "-g", "daemon off;"]
