#!/bin/bash
#Monitory Bandwidth Developed by Adminlogs.info
#Tested and verified with CentOS and RedHat 5

mkdir -p ~/bin && bash
wget -qO ~/nmap-7.01.tar.bz2 https://nmap.org/dist/nmap-7.01.tar.bz2
tar xvjf ~/nmap-7.01.tar.bz2 && cd ~/nmap-7.01
./configure --prefix=$HOME
make && make install
cd && rm -rf nmap{-7.01,.tar.bz2}
