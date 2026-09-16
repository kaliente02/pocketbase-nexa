FROM alpine:latest

WORKDIR /app

# Install dependencies
RUN apk add --no-cache wget unzip ca-certificates

# Download and extract PocketBase for Linux
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.20.0/pocketbase_0.20.0_linux_amd64.zip && \
    unzip pocketbase_0.20.0_linux_amd64.zip && \
    rm pocketbase_0.20.0_linux_amd64.zip && \
    chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]