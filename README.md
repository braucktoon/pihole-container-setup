# pihole-container-setup
Shell scripts and docker commands for running Pi-hole on a Raspberry Pi 4 using DHCP server and macvlan network.<br>
This is my journey for setting up Pi-hole + DHCP server on a raspberry pi 4, 2gb version using a macvlan network driver.<p>

Installing Docker...  I couldn't use the simple curl command / apt-get install, Docker CE had no release pkg for Buster but there were builds of each pkg needed.  So I installed each package of Docker CE manually using the debian pkg install command.  I got the pkgs from the docker website.  there is good documentation how to install here:<br> https://docs.docker.com/install/linux/docker-ce/debian/ <br>and downloaded the packages from here:<br> https://download.docker.com/linux/debian/dists/buster/pool/stable/armhf/

Here is the order in which I installed the packages:<br>
sudo dpkg -i containerd.io_1.2.6-3_armhf.deb <br>
sudo dpkg -i docker-ce-cli_18.09.7_3-0_debian-buster_armhf.deb <br>
sudo dpkg -i docker-ce_18.09.7_3-0_debian-buster_armhf.deb <br>
    
Then I created the pihole_run.sh and pihole_stop.sh scripts which you can find in the root of this project.  Note, I had to use native docker commands and not docker-compose because I could not find a suitable way to install docker-compose on Buster. Articles I found all seemed to be for jessie or stretch but the installation did not succeed and I didn't troubleshoot it. 

The easiest way to get the DHCP server working is to use host networking (https://docs.pi-hole.net/docker/DHCP/) but doing so could lead to port conflicts. The reaosn I am using macvlan networking instead of host networking is simply to resolve any potential port conflicts that could arise from other containers running on the same host using the same ports.  pihole uses lighttpd and it runs by default on port 80, the standard http port, and so do many other pieces of software,  So to avoid using a reverse proxy, I decided on macvlan driver for docker.  I assign the macvlan network to the pihole container and give the container a static ip in a range my DHCP server won't assign.

For more information on running pihole in a docker container, please see the official github site: https://github.com/pi-hole/docker-pi-hole and of course the https://pi-hole.net for other helpful information.

Here are some links I found useful during my research:<br>
https://docs.docker.com/install/linux/docker-ce/debian/ - How to install docker and run the hello-world container <br>  https://download.docker.com/linux/debian/dists/buster/pool/stable/armhf/ - Download docker pkgs for install on Buster<br>
https://docs.docker.com/engine/reference/commandline/run/ - docker run help<br>
https://fictionbecomesfact.com/2019/03/17/installing-docker-pi-hole-image-with-dhcp-server/ - example that used host networking<br>
https://docs.pi-hole.net/docker/DHCP/ - pi-hole options for networking when using DHCP server<br>
https://github.com/pi-hole/docker-pi-hole - github page for pi-hole containers<br>
https://docs.docker.com/network/macvlan/ - Overview of macvlan <br>
https://docs.docker.com/network/network-tutorial-macvlan/ - macvlan tutorial<br>
https://superuser.com/questions/1438483/docker-macvlan-static-ip-yet-a-dhcp-request - this is the post where I realized that I needed to set the static IP on the comtainer, not during the macvlan networking creation.  I did not experience this person's problem but their setup helped me :-)<br>

