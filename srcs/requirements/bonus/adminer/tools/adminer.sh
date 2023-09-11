#!/bin/sh

if [ -f $ADMINER_FILE ]; then
    echo Adminer 이미 완성됨
else
    curl -L -o $ADMINER_FILE \
        https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
fi

touch $ADMINER_HEALTHY_FILE
php -S $ADMINER_HOST:$ADMINER_PORT
