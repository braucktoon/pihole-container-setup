# pihole-container-setup
Shell scripts and docker commands for running Pihole on a raspberry pi using DHCP server and macvlan network
This is my journey of setting up pihole + DHCP server on a raspberry pi 4, 2gb version with Buster.

Installing Docker...  I couldn't use the simple curl command / apt-get install, Docker CE had no release pkg for Buster but there were builds of each pkg needed.  So I installed each package of Docker CE manually using the debian pkg install command.  I got the pkgs from the docker website.  there is good documentation how to install here: https://docs.docker.com/install/linux/docker-ce/debian/ and downloaded the packages from here: https://download.docker.com/linux/debian/dists/buster/pool/stable/armhf/

Here is the order in which I installed the packages:<br>
sudo dpkg -i containerd.io_1.2.6-3_armhf.deb <br>
sudo dpkg -i docker-ce-cli_18.09.7_3-0_debian-buster_armhf.deb <br>
sudo dpkg -i docker-ce_18.09.7_3-0_debian-buster_armhf.deb <br>
    
Then I created the pihole_run.sh and pihole_stop.sh scripts which you can find in the root of this project.  Note I had to use docker command and not docker compose because I could not find a suitable way to install docker-compose on Buster. Articles I found for pip installation did not succeed and I didn't troubleshoot it. 
