-- Create databases if they do not exist
SELECT 'CREATE DATABASE passbolt;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'passbolt')\gexec
SELECT 'CREATE DATABASE nextcloud;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'nextcloud')\gexec
