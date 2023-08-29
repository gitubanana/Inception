FROM alpine:3.17
RUN apk update && \
    apk add mariadb mariadb-client dumb-init

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/mariadb.sh /mariadb.sh 

ENTRYPOINT [ "dumb-init", "--", "/mariadb.sh" ]

