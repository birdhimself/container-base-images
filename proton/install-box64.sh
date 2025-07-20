#!/bin/bash

cat <<EOF > /etc/apt/sources.list.d/box64.sources
Types: deb
URIs: https://Pi-Apps-Coders.github.io/box64-debs/debian
Suites: ./
Signed-By: /etc/apt/keyrings/box64-archive-keyring.gpg
EOF
wget -qO- "https://pi-apps-coders.github.io/box64-debs/KEY.gpg" | gpg --dearmor -o /etc/apt/keyrings/box64-archive-keyring.gpg
apt-get update
apt-get install -y box64-generic-arm

cd /opt/proton/files/bin/

for bin in wine64 wine64-preloader wineserver; do
  mv "$bin" "${bin}.amd64"
  ln -sf /opt/wrappers/box64-wrapper "$bin"
done
