#!/bin/bash

SCRIPT_NAME=$(basename "$0")

echo "*******************************************************************"
echo "Installing ${SCRIPT_NAME}"
echo "*******************************************************************"

VS_CODE_DOWNLOAD="https://go.microsoft.com/fwlink/?LinkID=760868"

wget --progress=bar:force:noscroll "${VS_CODE_DOWNLOAD}" -O vscode.deb
apt-get install -y ./vscode.deb
rm ./vscode.deb
