#!/bin/bash

mkdir -m 755 -p /opt/shellinabox

/bin/echo -e '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d
chmod +x /usr/sbin/policy-rc.d

apt-get update
apt-get install -y -q --no-install-recommends shellinabox

rm /usr/sbin/policy-rc.d

install -m 755 /home/source/rc.local /etc

exit 0
