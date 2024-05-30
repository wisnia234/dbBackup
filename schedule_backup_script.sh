#!/bin/bash

USER=""
PASSWORD=""
DATABASE_NAME=""
BACKUP_DIR=""
CRON_PATTERN="* * * * *"
BACKUP_SCRIPT_DIRECTORY=$(pwd)

while getopts ":u:p:d:b:c:" o; do
  case ${o} in
    u )
      USER=$OPTARG
      ;;
    p )
      PASSWORD=$OPTARG
      ;;
    d )
      DATABASE_NAME=$OPTARG
      ;;
    b )
      BACKUP_DIR=$OPTARG
      ;;
    c )
      CRON_PATTERN=$OPTARG
      ;;
    *)
      ;;
  esac
done
shift $((OPTIND -1))

crontab -l | { cat; echo "$CRON_PATTERN $BACKUP_SCRIPT_DIRECTORY/backup_script.sh $USER $PASSWORD $DATABASE_NAME $BACKUP_DIR"; } | crontab -
