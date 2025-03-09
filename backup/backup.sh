#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/backup"
MYSQL_CONTAINER="mysql_db"
POSTGRES_CONTAINER="postgres_db"

mkdir -p $BACKUP_DIR

# MySQL Backup
docker exec $MYSQL_CONTAINER /usr/bin/mysqldump -u root --password=$MYSQL_ROOT_PASSWORD --all-databases > $BACKUP_DIR/mysql-$TIMESTAMP.sql

# PostgreSQL Backup
docker exec $POSTGRES_CONTAINER pg_dumpall -U $POSTGRES_USER > $BACKUP_DIR/postgres-$TIMESTAMP.sql

# Store in MinIO
mc alias set minio http://minio:9000 minioadmin miniosecurepass
mc cp $BACKUP_DIR/* minio/backups/
