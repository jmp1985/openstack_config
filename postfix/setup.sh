#!/bin/bash

# The directory containing this script
DIRECTORY=$(dirname $0)

# Write some info
echo ""
echo "We will send notifications via a gmail address"
echo ""

# Enter the username and password
read -p "Enter the username: " USERNAME
read -p "Enter the password: " PASSWORD

# Write the username and password to file
echo "[smtp.gmail.com]:587 ${USERNAME}@gmail.com:${PASSWORD}" | sudo tee /etc/postfix/sasl_passwd

# Make sure it's only readable by root
sudo chmod 600 /etc/postfix/sasl_passwd

# Copy over the new postfix configureation
sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.bak
sudo cp ${DIRECTORY}/main.cf /etc/postfix/main.cf
sudo diff /etc/postfix/main.cf.bak /etc/postfix/main.cf

# Process the password file
sudo postmap /etc/postfix/sasl_passwd

# Restart the postfix service
systemctl restart postfix.service
