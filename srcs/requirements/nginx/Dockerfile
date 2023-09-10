FROM alpine:3.17
RUN apk update && apk add \
    dumb-init \
    nginx \
    openssl \
    && rm -rf /var/cache/apk/*

RUN openssl req \
    -x509 \
    -newkey rsa:2048 \
    -nodes \
    -subj "/C=KO/ST=Seoul/L=Gangnam/O=42seoul/CN=taeypark.42.fr" \
    -keyout /etc/nginx/private.key -out /etc/nginx/certificate.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Static Web pages
COPY ./tools/mywiki /var/www/html/mywiki

ENTRYPOINT [ "dumb-init", "--", "nginx", "-g", "daemon off;" ]
