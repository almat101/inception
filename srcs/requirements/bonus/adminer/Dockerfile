FROM debian:bullseye

RUN apt update
RUN apt -y upgrade

RUN apt -y install vim wget php7.4 php7.4-fpm php7.4-mysql
# php7.4 php-fpm php-mysql

# Download Adminer and save as adminer.php
RUN mkdir -p /var/www/adminer && \
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/adminer/adminer.php
# Copy the configuration files of php-fpm
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create the directory for the php-fpm socket
RUN mkdir -p /run/php

# Change the owner of the files in /var/www/html to www-data
RUN chown -R www-data:www-data /var/www/adminer

# Ensure PHP-FPM logs are written to stdout/stderr
RUN ln -sf /dev/stdout /var/log/php7.4-fpm.log && \
    ln -sf /dev/stderr /var/log/php7.4-fpm-error.log

COPY tools/adminer.sh /usr/local/bin/adminer.sh

# Make the script executable
RUN chmod +x /usr/local/bin/adminer.sh

# start php-fpm in the foreground
CMD ["/usr/sbin/php-fpm7.4","-F"]
