#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

SLACK_DOWNLOAD=https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.0-amd64.deb
SKYPE_DOWNLOAD=https://repo.skype.com/latest/skypeforlinux-64.deb
ZOOM_DOWNLOAD=https://zoom.us/client/latest/zoom_amd64.deb

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list
apt-get update && apt-get install -y signal-desktop

# Skype
wget --progress=bar:force:noscroll $SKYPE_DOWNLOAD -O ./skype-desktop.deb
apt install -y ./skype-desktop.deb
rm ./skype-desktop.deb

# Slack
wget --progress=bar:force:noscroll $SLACK_DOWNLOAD -O ./slack-desktop.deb
apt-get install -y ./slack-desktop.deb
rm slack-desktop.deb

# Zoom
wget --progress=bar:force:noscroll $ZOOM_DOWNLOAD -O ./zoom-desktop.deb
apt-get install -y ./zoom-desktop.deb
rm ./zoom-desktop.deb
