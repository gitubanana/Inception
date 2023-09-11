FROM alpine:3.17
RUN apk update && apk add \
    bash \
    curl \
    dumb-init \
    && rm -rf /var/cache/apk/*

RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

COPY ./tools/filebrowser.sh /usr/local/bin/filebrowser.sh

ENTRYPOINT [ "dumb-init", "--", "filebrowser.sh" ]
