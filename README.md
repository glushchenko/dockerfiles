## ZNC bouncer install

### build dokcer container and install systemd service

git clone git@github.com:glushchenko/dockerfiles.git  
cd dockerfiles/znc && make build && make install

### edit nickname (root)

vim /var/lib/znc/config/znc.conf

### enable autoload on boot

sudo systemctl enable znc.service

