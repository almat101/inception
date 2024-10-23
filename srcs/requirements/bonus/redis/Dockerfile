FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y redis-server vim

RUN rm -rf /etc/redis/redis.conf

# RUN mkdir -p /var/lib/redis
# RUN chown -R 1000:1000 /var/lib/redis

COPY conf/redis.conf /etc/redis/redis.conf
COPY tools/redis.sh /usr/local/bin/redis.sh
RUN chmod +x /usr/local/bin/redis.sh

CMD ["/usr/local/bin/redis.sh"]
