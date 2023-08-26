FROM alpine:3.17
RUN apk update && \
    apk add mariadb mariadb-client dumb-init

RUN mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/mariadb.sh /mariadb.sh 

ENTRYPOINT [ "dumb-init", "--", "/mariadb.sh" ]

