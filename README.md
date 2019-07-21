# pihole-container-setup
Shell scripts and docker commands for running Pihole on a Raspberry pi using DHCP server and mtacvlan network
This is my journey of setting up pihole + DHCP server on a raspberry pi 4, 2gb version with Buster.

Installing Docker.  I couldn't use the simple curl command or apt-get install, Docker CE had no release pkg for Buster.  So I installed each package of Docker CE manually using the debian pkg install command.  I got the pkgs from the docker website.  there is good documentation how to install here: https://docs.docker.com/install/linux/docker-ce/debian/ and downloaded the packages from here: https://download.docker.com/linux/debian/dists/buster/pool/stable/armhf/

sudo dpkg -i containerd.io_1.2.6-3_armhf.deb 
sudo dpkg -i docker-ce-cli_18.09.7_3-0_debian-buster_armhf.deb 
sudo dpkg -i docker-ce_18.09.7_3-0_debian-buster_armhf.deb
    
Then I created the pihole_run.sh and pihole_stop.sh scripts which you can find in the root of this project.
