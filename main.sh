#!/bin/bash
cd /opt/beef
BEEF_PASSWORD=${BEEF_PASSWORD-$(openssl rand -hex 32)}
echo BEEF PASSWORD : $BEEF_PASSWORD
sed -i -e 's/passwd: "[^"]*"/passwd: "'${BEEF_PASSWORD}'"/' config.yaml
IP_ADDR=$(ip addr show eth0 | awk '/inet / {print $2}' | cut -d/ -f1)
sed -i -e 's/\(^\( *host: \)"\(0.0.0.0\)" *\)$/\2"'${IP_ADDR}'"/' config.yaml
./beef
