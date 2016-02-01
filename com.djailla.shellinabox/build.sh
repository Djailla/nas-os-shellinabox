#!/bin/bash

mkdir -m 755 -p /opt/shellinabox/

# Install dependencies
apt-get update
apt-get install  -y -q git libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf

# Checkout sources in /tmp
cd /tmp
git clone https://github.com/shellinabox/shellinabox.git

# Checkout last tag
cd shellinabox
git checkout tags/v2.19

# Build the component
autoreconf -i
./configure && make

# Copy the binary to /usr/bin
cp /tmp/shellinabox/shellinaboxd /usr/bin

# Cleanup
rm -rf /tmp/shellinabox

install -m 755 /home/source/rc.local /etc

exit 0
