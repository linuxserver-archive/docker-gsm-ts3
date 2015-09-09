#!/bin/bash

if [ "$(grep abc /etc/passwd | cut -d ":" -f6)" != "/config" ]; then usermod -d /config abc; fi 
if [ ! -f /config/ts3server ]; then /sbin/setuser abc wget -O /config/ts3server http://gameservermanagers.com/dl/ts3server; fi
if [ ! -x /config/ts3server ]; then /sbin/setuser abc chmod +x /config/ts3server; fi
if [ ! -f /config/serverfiles/ts3server_minimal_runscript.sh ]; then /sbin/setuser abc /config/ts3server auto-install; fi
