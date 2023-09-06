FROM alpine:3.17
RUN apk update && \
    apk add redis dumb-init

COPY ./conf/redis.conf /etc/redis.conf
COPY ./tools/redis-cache.sh /redis-cache.sh

ENTRYPOINT [ "dumb-init", "--", "/redis-cache.sh" ]
