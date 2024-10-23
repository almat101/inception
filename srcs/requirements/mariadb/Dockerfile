FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/maria.sh /usr/local/bin/maria.sh

RUN chmod +x /usr/local/bin/maria.sh

CMD ["/usr/local/bin/maria.sh"]
