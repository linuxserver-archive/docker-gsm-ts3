![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://www.linuxserver.io/) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](https://forum.linuxserver.io/index.php) or for real-time support our [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/gsm-ts3

![https://teamspeak.com](https://teamspeak.com/assets/logos/teamspeak.svg)

VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.

## Usage

```
docker create --name=gsm-ts3 \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-p 30033:30033 -p 9987:9987 \
-p 10011:10011 -p 41144:41144 \
linuxserver/gsm-ts3
```

**Parameters**
* `-p 9987` - Voice communication
* `-p 30033` - Filetransfer
* `-p 10011` - Serverquery
* `-p 41144` - tsdns
* `-v /etc/localhost` for timesync - *optional*
* `-v /config` -
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it gsm-ts3 /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

There are no setup required, just start the container, watch the log and note the Serverquery user\pass, and the token.


## Updates

* Upgrade to the latest version simply `docker restart gsm-ts3`.
* To monitor the logs of the container in realtime `docker logs -f gsm-ts3`.



## Versions

+ **10.09.15:** Inital Release. 
