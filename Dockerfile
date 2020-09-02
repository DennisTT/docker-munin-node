FROM alpine:3.12

LABEL maintainer="***REMOVED***"

EXPOSE 4949

RUN apk add --no-cache munin-node perl-net-cidr

COPY run.sh /
COPY munin-node.conf /etc/munin/

ENTRYPOINT ["/run.sh"]
