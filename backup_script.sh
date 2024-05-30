#!/bin/bash

USER=$1
PASSWORD=$2
DATABASE_NAME=$3
BACKUP_DIR=$4

TIMESTAMP=$(date +"%Y_%m_%d_%H_%M_%S")

mysqldump -u${USER} -p${PASSWORD} ${DATABASE_NAME} > ${BACKUP_DIR}/${DATABASE_NAME}-${TIMESTAMP}.sql

find $BACKUP_DIR -type f -mmin +3 -name '*.sql' -execdir rm -- '{}' \;

echo "Done"
