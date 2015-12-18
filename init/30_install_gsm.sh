#!/bin/bash

chown abc:abc /config

if [ ! -f /config/ts3server ]; then
/sbin/setuser abc wget -O /config/ts3server http://gameservermanagers.com/dl/ts3server
/sbin/setuser abc chmod +x /config/ts3server
fi

if [ ! -f /config/serverfiles/ts3server_minimal_runscript.sh ]; then cd /config && /sbin/setuser abc /config/ts3server auto-install ; fi

