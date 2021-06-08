#!/bin/bash
#provide mysql user and password
MYSQL_USER=root
MYSQL_PASSWORD=$(docker container exec -it db6774299425 cat /run/secrets/db_root_password)
#which directory to put backup
BACKUP_DIR="/home/backups"
#backup file name which is just the actual date of the backup creation
BACKUP_FILE_NAME="$(date +"%d-%m-%y-%H%M%S.sql.gz")"
# catching the container id and then use mysqldump on it
docker exec $(docker container ls | grep app_db* | awk '{ print $1}') bash -c 'exec mysqldump --all-databases -u "$MYSQL_USER" -p "$MYSQL_PASSWORD"' > gzip > "$BACKUP_DIR"/"$BACKUP_FILE_NAME";


