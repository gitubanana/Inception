FROM alpine:3.17
RUN apk update && apk add \
    dumb-init \
    mariadb \
    && rm -rf /var/cache/apk/*

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh

ENTRYPOINT [ "dumb-init", "--", "/usr/local/bin/mariadb.sh" ]
