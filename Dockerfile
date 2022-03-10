# --------------------------------------------------
# Dockerfile for Call of Duty 5 - WAW 
# By FiSTWHO - Forgotten-Games.net
# --------------------------------------------------
FROM ubuntu:focal

LABEL maintainer="fistwho@forgotten-games.net"

ENV STARTUP="+set fs_homepath config/default +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28965" +exec server.cfg +map_rotate"
ENV COD_GAME="nomod"
ENV COD_VERSION="1_7"

# Add i386 architecture support
RUN dpkg --add-architecture i386

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    binutils \
    lib32gcc1 \
    libstdc++6 \
    libstdc++6:i386 \
    libgcc1:i386 \
    libc6:i386 \
    wget \
    tar \
    bzip2

# Copy some files
COPY config/* /opt/config/
COPY binaries/* /opt/binaries/
COPY ./entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

RUN mkdir \
    /gameserver \
    /config

# Set the server dir
WORKDIR /gameserver

# Server gamefiles folder and config volume
VOLUME [ "/gameserver", "/config" ]

# Launch server at container startup
ENTRYPOINT ["/opt/entrypoint.sh"]