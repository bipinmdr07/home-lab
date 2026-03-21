-- Create databases if they do not exist
SELECT 'CREATE DATABASE passbolt;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'passbolt')\gexec
SELECT 'CREATE DATABASE nextcloud;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'nextcloud')\gexec
SELECT 'CREATE DATABASE immich;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'immich')\gexec
SELECT 'CREATE DATABASE n8n;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'n8n')\gexec
SELECT 'CREATE DATABASE postiz;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'postiz')\gexec
SELECT 'CREATE DATABASE temporal;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'temporal')\gexec
SELECT 'CREATE DATABASE temporal_visibility;' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'temporal_visibility')\gexec
