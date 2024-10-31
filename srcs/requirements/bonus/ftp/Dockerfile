FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vsftpd net-tools vim curl wget

# RUN rm /etc/vsftpd.conf
# RUN mkdir -p /var/ftp/
COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/vsftpd.sh /usr/local/bin/vsftpd.sh

RUN chmod +x /usr/local/bin/vsftpd.sh

RUN mkdir -p /var/www/html/uploads
RUN chmod 755 /var/www/html/uploads
RUN chown ${FTP_USER}:${FTP_USER} /var/www/html/uploads


# CMD ["vsftpd", "/etc/vsftpd.conf"]
CMD ["/usr/local/bin/vsftpd.sh"]
