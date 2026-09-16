FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache wget unzip

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.20.0/pocketbase_0.20.0_linux_amd64.zip && \
    unzip pocketbase_0.20.0_linux_amd64.zip && \
    chmod +x pocketbase && \
    rm pocketbase_0.20.0_linux_amd64.zip

EXPOSE 8080

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]