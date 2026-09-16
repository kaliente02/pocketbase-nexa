FROM alpine:latest

WORKDIR /app

# Download PocketBase for Linux
RUN apk add --no-cache wget unzip ca-certificates
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.20.0/pocketbase_0.20.0_linux_amd64.zip
RUN unzip pocketbase_0.20.0_linux_amd64.zip
RUN rm pocketbase_0.20.0_linux_amd64.zip
RUN chmod +x /app/pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]