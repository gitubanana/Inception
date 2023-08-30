#!/bin/sh

if [ -f $SQL_FILE ]; then
    echo mariadb 이미 완성됨
else
    mariadb-install-db --datadir=/var/lib/mysql

    cat << EOF > $SQL_FILE
    flush privileges;
    create database if not exists $MARIADB_DB;
    grant all privileges on $MARIADB_DB.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PW';
    grant all privileges on $MARIADB_DB.* to '$MARIADB_USER'@'localhost' identified by '$MARIADB_PW';
    flush privileges;
EOF

    mariadbd --bootstrap < $SQL_FILE

    chown -R mysql:mysql /var/lib/mysql
fi

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
mariadbd --user=mysql --datadir=/var/lib/mysql