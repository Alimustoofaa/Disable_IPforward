#!/bin/bash

while true; do
    # Check if IP forwarding is enabled
    ip_forward_status=$(sysctl net.ipv4.ip_forward | awk '{print $3}')

    if [ "$ip_forward_status" -eq 1 ]; then
        echo "IP forwarding is enabled. Disabling..."
        # Disable IP forwarding
        sysctl -w net.ipv4.ip_forward=0
        # Reload sysctl
        #sysctl -p
    fi
    # Wait for 10 minutes
    sleep 600
done
