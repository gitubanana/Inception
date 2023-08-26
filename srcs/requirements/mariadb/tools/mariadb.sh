#!/bin/sh

cat << EOF > config.sql
flush privileges;
create database if not exists $MARIADB_DB;
grant all privileges on $MARIADB_DB.* TO '$MARIADB_USER'@'%' identified by '$MARIADB_PW';
flush privileges;
EOF

mysqld --bootstrap < config.sql

chown -R mysql:mysql /run/mysqld /var/lib/mysql

mysqld --user=mysql --datadir=/var/lib/mysql