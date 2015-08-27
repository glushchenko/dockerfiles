build:
	docker build -t glushchenko:docker-znc .

install:
	openssl req -x509 -newkey rsa:4096 -keyout znc.pem -out znc.pem -days 3650 -nodes
	mv znc.pem .znc
	cp znc.service /etc/systemd/system
	mkdir -p /var/lib/znc
	cp -R .znc /var/lib/znc
