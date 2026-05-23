#!/bin/bash
# Idempotent: create app DBs (same as create-databases.sql), then shared DB_USER@'%' + grants.
# Run if you see MariaDB 1130 (host not allowed), Flyway "Unknown database 'grimmory'", etc. — docker-entrypoint-initdb.d only runs on an empty data dir.
set -euo pipefail
if mariadb -uroot -e "SELECT 1" &>/dev/null; then
	root=(mariadb -uroot)
else
	root=(mariadb -uroot -p"${MYSQL_ROOT_PASSWORD}")
fi
"${root[@]}" < /custom-scripts/create-databases.sql
"${root[@]}" <<-EOSQL
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
	GRANT ALL PRIVILEGES ON grimmory.* TO '${DB_USER}'@'%';
	GRANT ALL PRIVILEGES ON bookstackapp.* TO '${DB_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL
