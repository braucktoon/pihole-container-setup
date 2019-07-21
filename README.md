# pihole-container-setup
Shell scripts and docker commands for running Pihole on a raspberry pi using DHCP server and macvlan network.<br>
This is my journey of setting up pihole + DHCP server on a raspberry pi 4, 2gb version with Buster.<p>

Installing Docker...  I couldn't use the simple curl command / apt-get install, Docker CE had no release pkg for Buster but there were builds of each pkg needed.  So I installed each package of Docker CE manually using the debian pkg install command.  I got the pkgs from the docker website.  there is good documentation how to install here:<br> https://docs.docker.com/install/linux/docker-ce/debian/ <br>and downloaded the packages from here:<br> https://download.docker.com/linux/debian/dists/buster/pool/stable/armhf/

Here is the order in which I installed the packages:<br>
sudo dpkg -i containerd.io_1.2.6-3_armhf.deb <br>
sudo dpkg -i docker-ce-cli_18.09.7_3-0_debian-buster_armhf.deb <br>
sudo dpkg -i docker-ce_18.09.7_3-0_debian-buster_armhf.deb <br>
    
Then I created the pihole_run.sh and pihole_stop.sh scripts which you can find in the root of this project.  Note I had to use docker commands and not docker compose because I could not find a suitable way to install docker-compose on Buster. Articles I found for pip installation did not succeed and I didn't troubleshoot it. 

The reaosn I am using macvlan networking instead of host networking is simply to resolve any future port conflicts that could arise from other containers using the same ports as pihole.  pihole uses lighttpd and it runs by default on port 80, the standard http port, and so do many other pieces of software, I wanted to ensure I can have complete seperated of my containers on the host and avoid all port conflicts.  Therefore I assign the macvlan network to the pihole container and give the container a static ip in the range my DHCP server, won't assign. The DHCP sever cannot use the bridge network because it needs to broadcast to the subnet and this does not work, DHCP server was only broadcasting to the comntainer which my network devices could not see.  So macvlan was the answer. 
