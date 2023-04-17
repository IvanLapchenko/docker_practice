FROM golang:1.20-rc-bullseye AS go

WORKDIR /go/src/app

COPY index.go /go/src/app/

RUN go env -w GO111MODULE=off
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o /go/bin/gobin *.go

FROM gcr.io/distroless/cc-debian11

COPY --from=go /go/bin/gobin /

CMD [ "/gobin" ]
