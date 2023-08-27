#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
  	wp core download
	wp config create --dbhost=$MARIADB_HOST:$MARIADB_PORT --dbname=$MARIADB_DB \
					 --dbuser=$MARIADB_USER --dbpass=$MARIADB_PW
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --skip-email
  	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PW
    chown -R taeypark:taeypark . && chmod -R 770 .
else
	echo wordpress 이미 완성됨
fi

php-fpm81 --nodaemonize
