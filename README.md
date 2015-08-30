## ZNC bouncer install

git clone git@github.com:glushchenko/dockerfiles.git  

### build dokcer container for znc bouncer and install systemd service

cd dockerfiles/znc && make build && make install

Edit nickname (root) on /var/lib/znc/config/znc.conf

### enable autoload on boot

sudo systemctl enable znc.service

