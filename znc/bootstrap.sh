#!/bin/sh

version="1.6.1"

apt-get update
apt-get install -y build-essential libssl-dev libperl-dev pkg-config ca-certificates wget libicu-dev

useradd znc

# Build znc

mkdir -p /var/run/znc/ && chmod 777 /var/run/znc/
mkdir -p /src/znc && cd /src/znc

wget "http://znc.in/releases/archive/znc-${version}.tar.gz"
tar -zxf "znc-${version}.tar.gz"
cd "znc-${version}"
./configure && make && make install

# Build and install clientbuffer

cd /src/znc/
wget https://raw.githubusercontent.com/jpnurmi/znc-clientbuffer/master/clientbuffer.cpp
znc-buildmod clientbuffer.cpp
mv clientbuffer.so /usr/local/lib/znc

# Clean

rm -rf /src/znc/*

apt-get remove -y wget
apt-get autoremove -y
apt-get clean
