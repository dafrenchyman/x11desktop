#!/bin/bash

MEMORY=${1:-4gb}
DESKTOP_NAME=${2:-desktop_webtop}
HOME_FOLDER=~/docker_volumes/${DESKTOP_NAME}

docker build -t desktop_webtop -f Dockerfile_webtop .

docker run \
    --name=desktop_webtop \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=America/Los_Angeles \
    -p 3000:3000 \
    -v "${HOME_FOLDER}":/config \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --shm-size="${MEMORY}" \
    --restart no \
    "${DESKTOP_NAME}"
