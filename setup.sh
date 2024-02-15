#!/bin/bash

# Secure directory where the script will be copied
secure_directory="/var/lib/disable_ip_forward"

# Create the secure directory if it does not exist
mkdir -p "${secure_directory}"

# Copy the script to the secure directory
cp disable_ip_forwarding.sh "${secure_directory}/"

# Create the systemd service file
echo "[Unit]
Description=Disable IP Forwarding
After=network.target

[Service]
ExecStart=bash ${secure_directory}/disable_ip_forwarding.sh
Restart=always
User=$(whoami)

[Install]
WantedBy=default.target" > /etc/systemd/system/disable_ip_forwarding.service

# Reload systemd to load the new service file
systemctl daemon-reload

# Start and enable the service
systemctl start disable_ip_forwarding.service
systemctl enable disable_ip_forwarding.service
