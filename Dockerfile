FROM golang:1.21-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git clone https://github.com/pocketbase/pocketbase.git . && \
    go mod download && \
    CGO_ENABLED=0 GOOS=linux go build -o pocketbase cmd/main.go

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]