FROM alpine:3.17
WORKDIR /var/www/html
RUN apk update && \
    apk add curl dumb-init mysql-client php81-mysqli php81 php81-phar php81-fpm php81-iconv && \
    curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

RUN curl -L -o adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN adduser -D taeypark && \
    chown -R taeypark:taeypark . && chmod -R 770 .

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools/wordpress.sh /wordpress.sh

ENTRYPOINT [ "dumb-init", "--", "/wordpress.sh"]
