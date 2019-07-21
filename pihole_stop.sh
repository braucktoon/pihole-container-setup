#!/bin/bash
# Script to stop and remove the container and network

sudo docker stop pihole
sudo docker rm pihole
sudo docker network rm buster-vlan
