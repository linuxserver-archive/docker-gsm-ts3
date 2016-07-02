![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

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



### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

There are no setup required, just start the container, watch the log and note the Serverquery user\pass, and the token.

`Important, for unraid users, use the command line log rather than the webui log, docker logs -f gsm-ts3`


## Info

* Shell access whilst the container is running: `docker exec -it gsm-ts3 /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f gsm-ts3`


## Versions

+ **02.07.16:** Rebase to lsiobase/xenial
+ **10.09.15:** Inital Release. 

