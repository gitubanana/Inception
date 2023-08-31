#!/bin/sh

cat << EOF > $PW_FILE
$FTP_PW
$FTP_PW
EOF

adduser $FTP_USER < $PW_FILE

vsftpd /etc/vsftpd/vsftpd.conf