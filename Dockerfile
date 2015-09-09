FROM linuxserver/baseimage
MAINTAINER Lonix <lonix@linuxserver.io>
ENV APTLIST="wget mailutils postfix"

#Applying stuff
RUN apt-get update -q && \
apt-get install -yq $APTLIST
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD cron/ /etc/cron.d/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config
EXPOSE ["9987","30033","10011","41144"]