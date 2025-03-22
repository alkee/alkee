#!/bin/bash

# https://github.com/regclient/regclient/blob/main/docs/install.md

docker container run -it --rm --net host \
  -u "$(id -u):$(id -g)" -e HOME -v $HOME:$HOME \
  -v /etc/docker/certs.d:/etc/docker/certs.d:ro \
  ghcr.io/regclient/regctl:latest $@

# usage example
#  ./regctl.sh registry login docker.skia.site
#  ./regctl.sh repo ls docker.skia.site

