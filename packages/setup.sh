#!/bin/bash

# Helper function to read the packages and strip any comments
function _read_packages {
    while read line
    do
        echo $line | cut -d"#" -f1
    done < $1
}

# Update the system
sudo apt-get update
sudo apt-get upgrade

# Install the required packages
sudo apt install $(_read_packages packages.txt)

# Remove unused packages
sudo apt autoremove
