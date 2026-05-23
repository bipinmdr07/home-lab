#!/bin/bash
# Runs once on empty MariaDB data dir: apply custom-scripts/create-databases.sql, then grant the
# shared app user (DB_USER / DB_PASSWORD, same as Postgres) for remote Docker clients (@'%').
set -euo pipefail
# Socket auth as root is typical inside this image; use MYSQL_ROOT_PASSWORD if that fails.
if mariadb -uroot -e "SELECT 1" &>/dev/null; then
	root=(mariadb -uroot)
else
	root=(mariadb -uroot -p"${MYSQL_ROOT_PASSWORD}")
fi
"${root[@]}" < /custom-scripts/create-databases.sql

# Add one GRANT per database you add in create-databases.sql (same pattern as Postgres: separate DBs, one shared user).
"${root[@]}" <<-EOSQL
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
	GRANT ALL PRIVILEGES ON grimmory.* TO '${DB_USER}'@'%';
	GRANT ALL PRIVILEGES ON bookstackapp.* TO '${DB_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL
