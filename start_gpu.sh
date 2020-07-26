#!/bin/bash
MEMORY=${1:-8g}
DESKTOP_NAME=${2:-x11desktop}
HOME_FOLDER=~/docker_volumes/${DESKTOP_NAME}

mkdir -p "${HOME_FOLDER}/mysql"

# sudo password will be "x11docker"

x11docker \
    --desktop \
    --pulseaudio \
    --sudouser \
    --share /var/run/docker.sock \
    --home="${HOME_FOLDER}/home" \
    -- \
    --security-opt seccomp=unconfined \
    -v "${HOME_FOLDER}/mysql":/var/lib/mysql:rw \
    --gpus all \
    -- \
    --shm-size="${MEMORY}" \
    "x11desktop_gpu"
