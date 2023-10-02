FROM alpine:3.17
WORKDIR /var/www/html
RUN apk update && apk add \
    curl \
    dumb-init \
    mariadb-client \
    php81 \
    php81-mysqli \
    php81-session \
    && rm -rf /var/cache/apk/*

COPY ./tools/adminer.sh /usr/local/bin/adminer.sh

RUN chmod +x /usr/local/bin/adminer.sh

EXPOSE 8080

ENTRYPOINT [ "dumb-init", "--", "adminer.sh" ]
