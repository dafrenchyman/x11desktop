#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

PYCHARM_DOWNLOAD=https://download.jetbrains.com/python/pycharm-community-2021.2.2.tar.gz

# Download pycharm
wget --progress=bar:force:noscroll $PYCHARM_DOWNLOAD -O pycharm.tar.gz

# Install it
mkdir /opt/pycharm
tar xfz pycharm.tar.gz  -C /opt/pycharm --strip-components=1

# Cleanup
rm pycharm.tar.gz
