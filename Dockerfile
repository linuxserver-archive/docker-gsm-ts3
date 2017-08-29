FROM lsiobase/xenial
MAINTAINER sparklyballs

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_US.UTF-8" \
LANGUAGE="en_US:en"

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# Set the locale
RUN \
 locale-gen en_US.UTF-8

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
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
	wget && \

# cleanup
 apt-get clean && \
 rm -rf \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9987/udp 30033 10011 41144
VOLUME /config
