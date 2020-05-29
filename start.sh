#!/bin/bash
MEMORY=${1:-8g}
CONTAINER_NAME=${2:-x11desktop}
HOME_FOLDER=~/docker_volumes/${CONTAINER_NAME}/home

# sudo password will be "x11docker"

x11docker \
    --desktop \
    --hostnet \
    --pulseaudio \
    --sudouser \
    --init=systemd \
    --share /var/run/docker.sock \
    --home="${HOME_FOLDER}" \
    -- \
    --security-opt \
    seccomp=unconfined \
    -- \
    --shm-size="${MEMORY}" \
    "${CONTAINER_NAME}"