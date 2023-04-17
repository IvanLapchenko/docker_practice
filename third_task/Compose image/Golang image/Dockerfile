FROM golang:1.20-rc-bullseye

ENV HOST database
ENV PORT 5432
ENV USER postgres
ENV PASSWORD mysecretpassword
ENV DBNAME mytestdb

COPY test-connection.sh /go

ENTRYPOINT [ "/go/test-connection.sh" ]