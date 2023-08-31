FROM alpine:3.17
RUN apk update && \
    apk add vsftpd ncftp dumb-init

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./conf/user_list /etc/vsftpd/user_list
COPY ./tools/vsftpd.sh /vsftpd.sh

ENTRYPOINT [ "dumb-init", "--", "/vsftpd.sh" ]
