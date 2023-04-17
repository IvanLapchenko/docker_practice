#/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTRGES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;
    ALTER USER docker PASSWORD 'docker';
    CREATE DATABASE docker_db;
    GRANT ALL PRIVILEGES ON DATABASE docker_db TO docker;
    \c docker_db postgres
    GRANT ALL ON SCHEMA public TO docker;
EOSQL