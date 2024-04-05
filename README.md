# Portable workpress docker compose

## docker-compose.yml

- Update wordpress container_name
- Update wodpress 8085 port
- Update docker_db to macth db container_name
- Update db container_name

## .env

- Update WP_HOME/WP_SITEURL to match website domain
- Generate random password for DB_PASSWORD `openssl rand -base64 24`

## init.sql

- Replace init.sql with dumped mysql database

## wp-content

- Replace wp-content
