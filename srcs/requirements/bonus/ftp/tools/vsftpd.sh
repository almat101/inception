#!/bin/bash

service vsftpd start

adduser --disabled-password --gecos "" $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

echo "$FTP_USER" > etc/vsftpd.userlist

service vsftpd stop

/usr/sbin/vsftpd

