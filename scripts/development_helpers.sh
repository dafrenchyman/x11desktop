#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

SMARTGIT_DOWNLOAD=https://www.syntevo.com/downloads/smartgit/smartgit-19_1_7.deb
NGROK_DOWNLOAD=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
POSTMAN_DOWNLOAD=https://dl.pstmn.io/download/latest/linux64
DBEAVER_DOWNLOAD=https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

# Git Cola
apt-get install -y git-cola

# DBeaver
wget --progress=bar:force:noscroll $DBEAVER_DOWNLOAD -O dbeaver.deb
apt-get install -y ./dbeaver.deb
rm ./dbeaver.deb

# MariaDB
apt-get install -y mariadb-server

# ngrok
wget --progress=bar:force:noscroll $NGROK_DOWNLOAD -O ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin
rm ngrok-stable-linux-amd64.zip

# Postman
wget --progress=bar:force:noscroll $POSTMAN_DOWNLOAD -O postman.tar.gz
tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
ln -s /opt/Postman/Postman /usr/bin/postman

# SmartGit
wget --progress=bar:force:noscroll $SMARTGIT_DOWNLOAD -O smartgit.deb
apt-get install -y ./smartgit.deb
rm ./smartgit.deb

# CircleCI
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash
