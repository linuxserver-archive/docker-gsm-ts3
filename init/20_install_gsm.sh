#!/bin/bash
alias abc="/sbin/setuser abc"

if [ $(cat /etc/passwd | grep abc | cut -c":" -f6) != "/config" ]; then usermod -d /config abc; fi 
if [ ! -f /config/ts3server ]; then /sbin/setuser abc wget http://gameservermanagers.com/dl/ts3server; fi
if [ ! -x /config/ts3server ]; then /sbin/setuser abc chmod +x /conig/ts3server; fi
if [ ! -f /config/serverfiles/ts3server_minimal_runscript.sh ]; then /sbin/setuser abc /config/ts3server auto-install; fi
