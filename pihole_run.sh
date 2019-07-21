#!/bin/bash
# Script to create network and run the pihole docker container

# Default of directory you run this from, update to where ever.
DOCKER_CONFIGS="$(pwd)"

# Daemonize the macvlan network
docker network create -d macvlan \
  --subnet=10.0.0.0/24 \
  --gateway=10.0.0.1 \
  -o parent=eth0 \
  buster-vlan

# Daemonized docker container
docker run -d \
    --name pihole \
    --network=buster-vlan \
    --ip=10.0.0.251 \
    -v "${DOCKER_CONFIGS}/pihole/:/etc/pihole/" \
    -v "${DOCKER_CONFIGS}/dnsmasq.d/:/etc/dnsmasq.d/" \
    -e ServerIP="10.0.0.251" \
    -e TZ="America/New_York" \
    -e WEBPASSWORD="**********" \
    -e DNS1="1.1.1.1" \
    -e DNS2="1.0.0.1" \
    --restart=unless-stopped \
    --cap-add=NET_ADMIN \
    --dns 1.1.1.1 \
    pihole/pihole:latest
