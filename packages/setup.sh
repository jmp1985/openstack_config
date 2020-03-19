#!/bin/bash

# Update the system
sudo apt-get update
sudo apt-get upgrade

# Install the required packages
sudo apt install \
  build-essential \
  libboost-dev \
  libfftw3-dev \
  libpython3-dev \
  python3-venv \
  trash-cli \
  tigervncserver-standalone \
  ubuntu-desktop

# Remove unused packages
sudo apt autoremove

# Install cuda
bash install_cuda.sh
