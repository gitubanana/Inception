FROM alpine:3.17
RUN apk update && apk add \
    dumb-init \
    redis \
    && rm -rf /var/cache/apk/*

COPY ./conf/redis.conf /etc/redis.conf
COPY ./tools/redis-cache.sh /usr/local/bin/redis-cache.sh

ENTRYPOINT [ "dumb-init", "--", "/usr/local/bin/redis-cache.sh" ]
