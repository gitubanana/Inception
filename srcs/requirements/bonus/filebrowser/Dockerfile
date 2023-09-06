FROM alpine:3.17
RUN apk update && \
    apk add dumb-init curl bash
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

COPY ./tools/filebrowser.sh /filebrowser.sh

ENTRYPOINT [ "dumb-init", "--", "/filebrowser.sh" ]