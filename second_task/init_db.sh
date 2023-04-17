#! /bin/bash 

set -e 

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER simple_user;
    CREATE DATABASE mytestdb;
    GRANT ALL PRIVILEGES ON DATABASE mytestdb TO simple_user;
EOSQL

