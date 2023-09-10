#!/bin/sh

adduser $FTP_USER << EOF
$FTP_PW
$FTP_PW
EOF

vsftpd /etc/vsftpd/vsftpd.conf