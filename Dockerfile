FROM debian:8
MAINTAINER imashiro,<kirigaya@imashiro.cn>

# aria2
RUN apt-get update \
	&& apt-get install -y aria2

RUN \
 mkdir /aria2/ && \
 mkdir /aria2/downloads/ && \
 touch /aria2/session.lock

WORKDIR /aria2

VOLUME ["/aria2/downloads"]

EXPOSE 6800

ADD aria2.conf /aria2/aria2.conf

ENTRYPOINT ["/usr/bin/aria2c","--conf-path=/aria2/aria2.conf"]
CMD ['/bin/bash']