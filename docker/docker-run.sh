#!/bin/bash

docker run --rm --ipc host --gpus all --user $(id -u) -v /mnt/:/mnt/ -v `pwd`:/workdir/ -w /workdir "$@"
# docker run --rm --ipc host --gpus all -v /mnt/:/mnt/ -v `pwd`:/workdir/ -w /workdir "$@"
