#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTRGES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $NEWUSER;
    CREATE DATABASE $NEWDB;
    GRANT ALL PRIVILEGES ON DATABASE $NEWDB TO $NEWUSER;
    \c mytestdb postgres
    ALTER USER simple_user WITH SUPERUSER;
EOSQL