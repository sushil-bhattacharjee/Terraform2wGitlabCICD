#!/bin/bash

# Extract IPv4 addresses
ipv4_addresses=$(cat terraform.tfvars | awk -F'= ' '/ipv4_address/ {gsub(/"/, "", $2); print $2}')

# Loop over the IPs and ping them
for ip in $ipv4_addresses; do
  echo "Pinging $ip..."
  ping -c 4 $ip
  
  if [ $? -ne 0 ]; then
    echo "Ping failed for $ip" >&2
    exit 1
  fi
done
