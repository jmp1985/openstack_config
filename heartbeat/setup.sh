#!/bin/bash

# The current directory
DIRECTORY=$(dirname $0)

# Helper function to write email address
function _write_email_address {
    echo ""
    echo "A cron job will be setup to send hourly notifications to ensure that"
    echo "the user is aware that the virtual machine is still active. This is"
    echo "because we pay for machine usage by the hour!"
    echo ""
    if [ -e /etc/email_address ]
    then
        RECIPIENT=$(sudo cat /etc/email_address)
        while true
	do
	    read -p "The recipient is set to \"${RECIPIENT}\". Would you like to keep this address (yes/no)? " KEEP
    	    case ${KEEP} in
            "yes") return;;
            "no") break;;
            *) echo "Answer yes/no.";;
            esac
	done
    fi
    read -p "Enter email address for notifications: " RECIPIENT
    echo ${RECIPIENT} | sudo tee /etc/email_address
}

# Install the cron job
function _install_cron_job {
    sudo cp -v ${DIRECTORY}/heartbeat.sh /etc/cron.hourly
}

# Write the recipient email address
_write_email_address
_install_cron_job
