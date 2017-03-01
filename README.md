# docker-vsftpd

[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/steenzout/docker-templates/master/LICENSE)

Resources to build an [Alpine][alpine] [vsftpd][vsftpd] container.


## Dependencies

- [hub.docker.com/_/alpine/](https://hub.docker.com/_/alpine/)


## Usage

Start:

```bash
$ docker run \
    --rm \
    -td \
    steenzout/vsftpd
```

Log files:

```
$ docker logs \
    -f <container name>
```

## Links

- [vsftpd][vsftpd]
- [vsftpd.conf](https://security.appspot.com/vsftpd/vsftpd_conf.html)
- [stackoverflow: How to configure vsftpd to work with passive mode](http://serverfault.com/questions/421161/how-to-configure-vsftpd-to-work-with-passive-mode)
- [github gist: docker-log-gist.md](https://gist.github.com/afolarin/a2ac14231d9079920864)


[alpine]:	https://alpinelinux.org/	"Alpine Linux"
[vsftpd]:	https://security.appspot.com/vsftpd.html	"vsftpd"
