FROM postgres:15-bullseye

ENV NEWUSER simple_user
ENV NEWDB mytestdb

RUN set -eu ; \
    mkdir -p /docker-entrypoint-initdb.d

COPY ./init-db.sh /docker-entrypoint-initdb.d