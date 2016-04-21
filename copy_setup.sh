#!/bin/bash


# /etc/postgresql/9.5/main/
PG_CONFIG_FOLDER="/etc/postgresql/9.5/main/"; #$(ps auxw|grep postgres|grep -oP 'config_file=\K.*/') 
echo "CONFIG : "$PG_CONFIG_FOLDER
copy_setup () {
    echo "Copying File: "$1
    sudo cp $1.conf $PG_CONFIG_FOLDER$1
    sudo mv $PG_CONFIG_FOLDER$1 $PG_CONFIG_FOLDER$1.conf
    sudo chown postgres $PG_CONFIG_FOLDER$1.conf
}
# copy_setup ph_hba

ls -d *.conf | grep -oP '([a-zA-Z_-]+)(?=.conf)' | while read line
do
    copy_setup $line
done

sudo service postgresql restart