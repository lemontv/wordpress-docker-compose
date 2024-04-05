# Backup database

mkdir -p ./backups

current_date=$(date +"%Y-%m-%d")

docker compose exec -T mysql sh -c 'mysqldump -uroot -hlocalhost $MYSQL_DATABASE' >"./backups/database-backup-$current_date.sql"
