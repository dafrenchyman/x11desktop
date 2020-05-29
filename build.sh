#!/bin/bash
CONTAINER_NAME=x11desktop

# Helper functino to check a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# install x11 docker if not already installed
if ! command_exists x11docker ; then
    echo "Installing x11docker"
    curl -fsSL https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker | sudo bash -s -- --update
fi

docker build -t ${CONTAINER_NAME} .
