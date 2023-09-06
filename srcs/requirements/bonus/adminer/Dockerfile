FROM alpine:3.17
WORKDIR /var/www/html
RUN apk update && \
    apk add curl dumb-init php81 php81-session mysql-client php81-mysqli

COPY ./tools/adminer.sh /adminer.sh

ENTRYPOINT [ "dumb-init", "--", "/adminer.sh" ]
