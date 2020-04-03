#!/bin/bash

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install the required packages
sudo apt install -y \
  build-essential \
  libboost-dev \
  libfftw3-dev \
  libpython3-dev \
  python3-venv \
  trash-cli \
  tigervnc-standalone-server

# Remove unused packages
sudo apt autoremove -y

# Install cuda
bash install_cuda.sh
