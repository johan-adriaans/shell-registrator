# shell-registrator
#
# VERSION 0.0.1

FROM johanadriaans/docker-base-alpine:3.3

MAINTAINER Johan Adriaans <johan@shoppagina.nl>

# Install tools
RUN apk --update add docker curl && rm -rf /var/cache/apk/*

# Setup etcd ip/port
ENV ETCD_HOST 127.0.0.1:2379

# Set docker host
ENV DOCKER_HOST unix:///tmp/docker.sock

ADD service /etc/service
ENTRYPOINT ["/sbin/dumb-init", "/sbin/runsvdir", "-P", "/etc/service"]
