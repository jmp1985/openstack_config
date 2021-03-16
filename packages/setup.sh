#!/bin/bash

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install the required packages
sudo apt install -y \
  build-essential \
  libboost-dev \
  libfftw3-dev \
  libpython3.8-dev \
  python3.8-venv \
  trash-cli \
  tigervnc-standalone-server

# Install minimal desktop for VNC
sudo apt install -y \
  eog \
  gnome-panel \
  gnome-terminal \
  nautilus \
  ubuntu-artwork \
  ubuntu-session \
  ubuntu-settings

# Install stuff for RDP
sudo apt install xrdp
sudo adduser xrdp ssl-cert  dp
sudo ufw allow 3389/tcp
sudo /etc/init.d/xrdp restart

# Remove unused packages
sudo apt autoremove -y

# Install cuda
bash install_cuda.sh
