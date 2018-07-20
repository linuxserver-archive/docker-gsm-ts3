FROM lsiobase/ubuntu:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV TS3SERVER_LICENSE="accept"

RUN \
 echo "**** install packages ****" && \
 dpkg --add-architecture i386 && \
 apt-get update && \
 apt-get install -y \
	bc \
	binutils \
	bsdmainutils \
	bzip2 \
	curl \
	file \
	libmariadb2 \
	mailutils \
	postfix \
	python \
	tmux \
	unzip \
	util-linux \
	lib32gcc1 \
	libstdc++6:i386 \
	wget && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9987/udp 30033 10011 41144
VOLUME /config
