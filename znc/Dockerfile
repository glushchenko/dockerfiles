FROM debian:jessie
MAINTAINER Oleksandr Glushchenko "contact@fluder.co"

ENV ZNC_VERSION 1.6.1

RUN useradd znc

RUN apt-get update \
    && apt-get install -y build-essential libssl-dev libperl-dev pkg-config ca-certificates wget libicu-dev \
    && mkdir -p /src \
    && cd /src \
    && wget "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz" \
    && tar -zxf "znc-${ZNC_VERSION}.tar.gz" \
    && cd "znc-${ZNC_VERSION}" \
    && ./configure \
    && make \
    && make install \
    && apt-get remove -y wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /src* /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh

USER znc

EXPOSE 7000
VOLUME ["/znc-data"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]