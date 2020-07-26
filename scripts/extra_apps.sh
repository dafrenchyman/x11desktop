#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

# Extra Apps
apt-get install -y \
    chromium-browser \
    firefox \
    graphviz \
    libreoffice \
    nano

# Install argcomplete and globalize it
pip3 install argcomplete
activate-global-python-argcomplete
