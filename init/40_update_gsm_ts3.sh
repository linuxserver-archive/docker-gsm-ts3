#!/bin/bash
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0
cd /config
/sbin/setuser abc /config/ts3server update-functions
/sbin/setuser abc /config/ts3server update
