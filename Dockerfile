FROM linuxserver/baseimage
MAINTAINER Lonix <lonix@linuxserver.io> Sparklyballs <sparklyballs@linuxserver.io>
ENV APTLIST="wget tmux mailutils postfix"

# install packages
RUN apt-get update -q && \
apt-get install -yq $APTLIST && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config
EXPOSE 9987/udp 30033 10011 41144
