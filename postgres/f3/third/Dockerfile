# syntax=docker/dockerfile:1

# golang image
FROM golang:1.20-rc-bullseye as build

WORKDIR /go/src/app

COPY app.go .

RUN go env -w GO111MODULE=off
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o /go/bin/mybin *.go

# debian wrapper
FROM gcr.io/distroless/cc-debian11

COPY --from=build /go/bin/mybin /

CMD ["/mybin"]