#!/bin/bash

MYSQL_DATA_DIR="/var/lib/mysql"
FIRST_RUN="FALSE"

if [ "$(ls -A $MYSQL_DATA_DIR)" ]; then
    echo "Database already setup"
else
    echo "*******************************************************************"
    echo "Setting up MariaDB"
    echo "*******************************************************************"
    mysql_install_db --user="$USER"
    FIRST_RUN="TRUE"
fi

# Run first as sudo (it won't work) but it'll set the permissions up correctly
sudo -p "Please enter sudo password: " /usr/bin/mysqld_safe --user="$USER" --datadir=${MYSQL_DATA_DIR}

# Run again without sudo and it'll work
/usr/bin/mysqld_safe --user="$USER" --datadir=${MYSQL_DATA_DIR} &

if [ "$FIRST_RUN" == "TRUE" ]; then
    sleep 5
    echo "*******************************************************************"
    echo "Securing MariaDB"
    echo "*******************************************************************"
    mysql_secure_installation
fi
