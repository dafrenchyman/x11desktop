#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

apt-get install -y \
    apt-utils \
    cmake \
    dbus-x11 \
    git \
    libxv1 \
    menu-xdg \
    mime-support \
    mesa-utils \
    mesa-utils-extra \
    openjdk-11-jdk \
    openjdk-11-jre \
    procps \
    psmisc \
    python3-distutils \
    python3-pip \
    python3-venv \
    sudo \
    vim \
    wget \
    xclip \
    xdg-utils \
    xdg-user-dirs
