FROM debian:jessie
MAINTAINER Oleksandr Glushchenko "contact@fluder.co"

ADD bootstrap.sh /tmp/
RUN chmod +x /tmp/bootstrap.sh && /tmp/bootstrap.sh

USER znc
EXPOSE 7000
VOLUME ["/znc-data"]
ENTRYPOINT ["/usr/local/bin/znc", "-f", "--datadir=/znc-data"]
