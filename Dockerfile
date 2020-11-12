FROM ubuntu:18.04

LABEL maintainer="***REMOVED***"

EXPOSE 4949

RUN apt-get update && apt-get install -y \
    libnet-cidr-perl \
    munin-node \
 && rm -rf /var/lib/apt/lists/*

COPY run.sh /
COPY munin-node.conf /etc/munin/

ENTRYPOINT ["/run.sh"]
