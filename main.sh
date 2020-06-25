#!/bin/bash
cd /opt/beef
BEEF_PASSWORD=${BEEF_PASSWORD-$(openssl rand -hex 32)}
echo BEEF PASSWORD : $BEEF_PASSWORD
sed -i -e 's/passwd: "[^"]*"/passwd: "'${BEEF_PASSWORD}'"/' config.yaml
if [ "z${BEEF_PUBLIC}" != "z" ] ; then
    sed -e 's/\(^\( *\)port: "3000" *\)$/\1\n\2public: "'${BEEF_PUBLIC}'"/' config.yaml
fi
./beef
