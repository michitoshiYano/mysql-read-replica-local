#!/bin/sh
until mysqladmin ping -h$SOURCE_MYSQL_HOST -u$SOURCE_MYSQL_USER -p$SOURCE_MYSQL_PASSWORD --silent; do
    sleep 1
done

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e" \
    CHANGE MASTER TO \
        MASTER_HOST = '$SOURCE_MYSQL_HOST', \
        MASTER_PORT = 3306, \
        MASTER_USER = '$SOURCE_MYSQL_USER', \
        MASTER_PASSWORD = '$SOURCE_MYSQL_PASSWORD', \
        MASTER_AUTO_POSITION = 1; \
    START SLAVE; \
"