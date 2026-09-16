FROM golang:1.21-alpine as builder
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/pocketbase/pocketbase.git .
RUN go mod download
RUN CGO_ENABLED=0 go build -o pocketbase cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/pocketbase .
EXPOSE 8090
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]