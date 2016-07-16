FROM debian:jessie
MAINTAINER Oleksandr Glushchenko "contact@fluder.co"

ENV ZNC_VERSION 1.6.2

RUN useradd fluder

RUN apt-get update \
    && apt-get install -y build-essential libssl-dev libperl-dev pkg-config ca-certificates wget libicu-dev \
    && apt-get install -y --no-install-recommends oidentd supervisor \
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
ADD oidentd.conf /etc/oidentd.conf
ADD supervisor.conf /etc/supervisor/conf.d/znc.conf

RUN mkdir -m 777 -p /var/log/supervisor/
RUN touch /var/log/supervisor/supervisord.log && chmod 777 /var/log/supervisor/supervisord.log
RUN chmod 777 /etc/oidentd.conf

USER fluder

EXPOSE 7000
EXPOSE 113

VOLUME ["/znc-data"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/znc.conf"]
