#!/bin/bash

# etc/postgresql/9.5/main/
PG_CONFIG_FOLDER=$(ps auxw|grep postgres|grep -oP 'config_file=\K.*/') 

get_setup () {
    echo "Getting File: "$1
    sudo cp $PG_CONFIG_FOLDER$1.conf .
    sudo chown $USER $1.conf
}

ls -d $PG_CONFIG_FOLDER*.conf | grep -oP '([a-zA-Z_-]+)(?=.conf)' | while read line
do
    get_setup $line
done