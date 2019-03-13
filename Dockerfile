FROM golang:1.12-alpine as builder

RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates

WORKDIR /app

COPY ./app/go.mod /app/
COPY ./app/go.sum /app/

RUN go mod download

COPY ./app/* /app/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/entrypoint

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/bin/entrypoint /go/bin/entrypoint

ENTRYPOINT ["/go/bin/entrypoint"]