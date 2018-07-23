[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://teamspeak.com
[hub]: https://hub.docker.com/r/linuxserver/gsm-ts3/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/gsm-ts3
[![](https://images.microbadger.com/badges/version/linuxserver/gsm-ts3.svg)](https://microbadger.com/images/linuxserver/gsm-ts3 "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/gsm-ts3.svg)](https://microbadger.com/images/linuxserver/gsm-ts3 "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/gsm-ts3.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/gsm-ts3.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-gsm-ts3)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-gsm-ts3/)

VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.

[![teamspeak](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/teamspeak-banner.png)][appurl]

## Usage

```
docker create --name=gsm-ts3 \
--net=host \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
linuxserver/gsm-ts3
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`

* `--net=host` - Shares host networking with container, **required**
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - volume for config files
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on ubuntu xenial with s6 overlay, for shell access whilst the container is running do `docker exec -it gsm-ts3 /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

There is no setup required, just start the container, watch the log and note the Serverquery user\pass, and the token.

`Important, for unraid users, use the command line log rather than the webui log, docker logs -f gsm-ts3`


## Info

* Shell access whilst the container is running: `docker exec -it gsm-ts3 /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f gsm-ts3`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' gsm-ts3`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/gsm-ts3`

## Versions

+ **23.07.18:** Fix installer link and update dependencies.
+ **04.03.18:** Tail log to /dev/null to clear up file cannot be found.
+ **19.02.18:** Add license accept variable and print warning in init to view license.
+ **12.12.17:** Fix continuation lines.
+ **03.12.17:** Add bc dependency.
+ **29.08.17:** Add binutils and unzip dependencies (thanks n3mur1t0r).
+ **30.10.16:** Update to pick up changed location of config file.
+ **14.10.16:** Add version layer information.
+ **21.09.16:** Ipv6 fix for unraid, make separate tag for unraid, other users shouldn't have to
suffer because unraid doesn't support ipv6
+ **18.09.16:** Correct README with net=host instead of port mappings.
+ **10.09.16:** Add layer badges to README.
+ **28.08.16:** Add badges to README, improve dependencies.
+ **13.08.16:** Rebase to lsiobase/xenial
+ **10.09.15:** Inital Release.
