FROM postgres:15-bullseye

RUN set -eu ; \
    mkdir -p /docker-entrypoint-initdb.d

COPY ./init-db.sh /docker-entrypoint-initdb.d