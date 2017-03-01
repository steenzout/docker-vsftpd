FROM alpine:latest
MAINTAINER Pedro Salgado "steenzout@ymail.com"

ENV FTP_USER ftp_user
ENV FTP_PASSWORD secret
ENV FTP_HOME /var/vsftp

# installation

RUN set -x \
    && apk add --update vsftpd \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /etc/vsftpd \
    && mkdir -p /var/log/vsftpd \
    && ln -sf /dev/stdout /var/log/vsftpd/vsftpd.log


# configuration

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf

ONBUILD RUN addgroup -S vsftpd \
    && adduser -D -h ${FTP_HOME} -s /bin/false -G vsftpd ${FTP_USER} \
    && addgroup ${FTP_USER} ${FTP_GROUP} \
    && echo "root:$(echo ${FTP_PASSWORD} | mkpasswd)" | chpasswd

VOLUME /etc/vsftpd
VOLUME /var/log/vsftpd
ONBUILD VOLUME "${FTP_HOME}"

EXPOSE 20 21 10090-10100

ENTRYPOINT ["/usr/sbin/vsftpd"]
CMD ["/etc/vsftpd/vsftpd.conf"]
