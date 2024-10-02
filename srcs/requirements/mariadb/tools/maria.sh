#!/bin/bash

#start mariadb service
service mariadb start

sleep 8
# Create the table
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MARIA_DB}\`;"

# Create the user
mariadb -e "CREATE USER IF NOT EXISTS \`${MARIA_USER}\`@'localhost' IDENTIFIED BY '${MARIA_PASSWORD}';"
# Grant privileges to the user
mariadb -e "GRANT ALL PRIVILEGES ON \`${MARIA_DB}\`.* TO \`${MARIA_USER}\`@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"

#change the root password to the one set in the environment
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
#flush privileges to apply changes to all users
mariadb -p${MARIA_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
#shutdown the server
mariadb-admin -u root -p"${MARIA_ROOT_PASSWORD}" shutdown
#start the server in safe mode
exec mariadbd-safe
