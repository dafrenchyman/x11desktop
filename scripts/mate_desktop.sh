#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

apt-get install -y \
    fonts-noto-color-emoji \
    fortunes \
    gnome-colors \
    gnome-colors-common \
    gnome-themes-extra \
    gnome-themes-standard \
    mate-applets \
    mate-desktop-environment-extras \
    mate-desktop-environment-core \
    mate-icon-theme \
    mate-icon-theme-faenza \
    mate-notification-daemon \
    mate-panel \
    mate-system-monitor \
    mate-tweak \
    mate-utils \
    ubuntu-mate-themes
