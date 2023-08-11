#!/bin/bash

set -e

MNT_DIRECTORY=${HOME}/work/

build=0
while getopts "b" flag
do
    case "${flag}" in
    b) build=1;;
    esac
done

if [ ${build} -eq 1 ]
then
source build.sh
fi

xhost local:docker
docker run \
    --privileged \
    --rm \
    -it \
    -e DISPLAY=${DISPLAY} \
    -e XDG_CONFIG_DIRS=${XDG_CONFIG_DIRS} \
    -v /etc/xdg/xdg-ubuntu:/etc/xdg/xdg-ubuntu \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --workdir /Downloads \
    --network host \
    -v ${MNT_DIRECTORY}:/mnt/ \
    imhex-viewer 
