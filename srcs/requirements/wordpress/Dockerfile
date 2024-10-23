FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget vim php7.4 php7.4-fpm php7.4-mysql mariadb-client curl git unzip


# Download and extract WordPress in var/www/html
RUN wget https://wordpress.org/wordpress-6.6.2.tar.gz -P /var/www
RUN tar -xzf /var/www/wordpress-6.6.2.tar.gz -C /var/www
RUN rm /var/www/wordpress-6.6.2.tar.gz
RUN mv /var/www/wordpress /var/www/html

# Copy the configuration files of php-fpm
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

# RUN chown -R root:root /var/www/html

# Download wp-cli to manage WordPress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh

CMD ["/usr/local/bin/auto_config.sh"]

