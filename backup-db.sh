# Backup database
docker exec --env-file .env docker_db sh -c 'exec mysqldump -uroot -p"$DB_PASSWORD" $DB_NAME' > init.sql
