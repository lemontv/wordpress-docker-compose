#!/bin/bash

# Set default values
default_port="8080"
default_domain="localhost"

# Ask the user for the port with a default value
read -p "Enter the port [Default: $default_port]: " port
port=${port:-$default_port}

# Ask the user for the domain with a default value
read -p "Enter the domain [Default: $default_domain]: " domain
domain=${domain:-$default_domain}

# Generate a random password for the database
random_password=$(openssl rand -base64 32)

# Create the .env file with the provided values
cat >.env <<EOF
WP_PORT=$port
WP_HOME=http://$domain
WP_SITEURL=http://$domain

DB_NAME=wordpress
DB_USER=wordpress
DB_PASSWORD=$random_password
EOF

echo -e ".env file has been created."

# Create the nginx.conf file with the provided values
cat >nginx.conf <<EOF
server {
    listen 80;
    listen [::]:80;

    server_name $domain;

    location / {
        proxy_pass http://localhost:$port;
        proxy_set_header X-Forwarded-For \$remote_addr;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header Host \$host;
    }
}
EOF

echo "nginx.conf file has been created."
