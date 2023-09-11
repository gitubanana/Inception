FROM alpine:3.17
RUN apk update && apk add \
    dumb-init \
    vsftpd \
    && rm -rf /var/cache/apk/*

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./conf/user_list /etc/vsftpd/user_list
COPY ./tools/vsftpd.sh /usr/local/bin/vsftpd.sh

ENTRYPOINT [ "dumb-init", "--", "vsftpd.sh" ]
