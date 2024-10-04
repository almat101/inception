#!bin/bash

sleep 20

cd /var/www/html

# Create a new wp-config.php file via wp-cli
wp config create	--allow-root \
					--dbname=$MARIA_DB \
					--dbuser=$MARIA_USER \
					--dbpass=$MARIA_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/html'

# Install wordpress via wp-cli(created also the admin user )
wp core install	--url=$DOMAIN_NAME \
				--title=$WP_TITLE \
				--admin_user=$WP_ROOT_USER \
				--admin_password=$WP_ROOT_PASSWORD \
				--admin_email=$WP_ROOT_EMAIL \
				--skip-email --allow-root \
				--path='/var/www/html'

# Create a new user as an author user (second user)
wp user create	$WP_USER \
				$WP_EMAIL \
				--role=author \
				--user_pass=$WP_PASSWORD \
				--allow-root \
				--path='/var/www/html'

#execute the cgi
/usr/sbin/php-fpm7.4 -F
