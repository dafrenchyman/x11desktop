#!/bin/bash

MYSQL_DATA_DIR="/var/lib/mysql"

if [ "$(ls -A $MYSQL_DATA_DIR)" ]; then
    echo "Database already setup"
else
    echo "Database not setup"
    mysql_install_db --user="$USER"
fi

# Run first as sudo (it won't work) but it'll set the permissions up correctly
sudo -p "Please enter sudo password: " /usr/bin/mysqld_safe --user="$USER" --datadir=${MYSQL_DATA_DIR}

# Run again without sudo and it'll work
/usr/bin/mysqld_safe --user="$USER" --datadir=${MYSQL_DATA_DIR} &
