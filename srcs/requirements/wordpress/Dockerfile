FROM alpine:3.17
WORKDIR /var/www/html
RUN apk update && apk add \
    curl \
    dumb-init \
    mysql-client \
    php81 \
    php81-fpm \
    php81-iconv \
    php81-mysqli \
    php81-phar \
    php81-tokenizer \
    && rm -rf /var/cache/apk/*

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

RUN adduser -D taeypark

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh

ENTRYPOINT [ "dumb-init", "--", "/usr/local/bin/wordpress.sh"]
