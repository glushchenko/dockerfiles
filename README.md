## ZNC bouncer install

### Build dokcer container and install systemd service

git clone git@github.com:glushchenko/dockerfiles.git 
cd dockerfiles/znc && make build && make install

Edit nickname (root) on /var/lib/znc/config/znc.conf

### Enable autoload on boot

sudo systemctl enable znc.service

