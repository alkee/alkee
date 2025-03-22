#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 <docker_image_name>"
	exit 1
fi

docker_image_name=$1
if [ "$(docker images -q $docker_image_name 2> /dev/null)" == "" ]; then
	echo "Docker image not exists"
	exit 1
fi

username=`id -un`
set -e # exit on error

docker build -t ${docker_image_name}:${username}\
	--build-arg USER_UID=$(id -u)  \
	--build-arg IMAGENAME=${docker_image_name} \
	--build-arg USERNAME=${username} \
	-f rootless.Dockerfile .
