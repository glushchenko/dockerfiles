MOUNT_FROM = /srv/znc 

# Auto compile modules dir (znc-build)
MODULES = $(MOUNT_FROM:=/modules)

build:
	sudo mkdir -m 777 -p $(MOUNT_FROM)
	docker build -t ${USER}/znc .

init:
	mkdir -p $(MODULES)
	wget -P $(MODULES) https://raw.githubusercontent.com/jpnurmi/znc-clientbuffer/master/clientbuffer.cpp
	openssl req -x509 -newkey rsa:4096 -keyout $(MOUNT_FROM:=/znc.pem) -out $(MOUNT_FROM:=/znc.pem) -days 3650 -nodes
	docker run -v $(MOUNT_FROM:=:/znc-data) -i -t ${USER}/znc --makeconf

run:
	docker run -d -p 7000:7000 -v $(MOUNT_FROM:=:/znc-data) ${USER}/znc

.PHONY: build init install run
