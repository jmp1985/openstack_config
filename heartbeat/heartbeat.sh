#!/bin/bash

# Get the hostname and recipient
HOSTNAME=$(hostname)
RECIPIENT=$(cat /etc/email_address)

# End an email to the recipient
sendmail ${RECIPIENT} <<EOF
From: ${HOSTNAME}
Subject: Heartbeat from ${HOSTNAME}
${HOSTNAME} is alive!
.
EOF
