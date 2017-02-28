FROM alpine:latest
MAINTAINER Pedro Salgado "steenzout@ymail.com"

# installation

RUN set -x \
    && apk add --update \
        vsftpd \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /etc/vsftpd \
    && mkdir -p /var/log/vsftp


# configuration

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN ln -sf /dev/stdout /var/log/vsftpd/vsftpd.log


VOLUME /etc/vsftpd
VOLUME /var/log/vsftpd

EXPOSE 20 21 10090-10100

ENTRYPOINT ["/usr/sbin/vsftpd"]
CMD ["/etc/vsftpd/vsftpd.conf"]
