#!/bin/bash
mkdir -p ~/bin && bash
wget -qO ~/nmap-7.01.tar.bz2 https://nmap.org/dist/nmap-7.01.tar.bz2
tar xvjf ~/nmap-7.01.tar.bz2 && cd ~/nmap-7.01
./configure --prefix=$HOME
make && make install
cd && rm -rf nmap{-7.01,.tar.bz2}
#
############################
##### User Script End  #####
############################
#
############################
##### Core Script Ends #####
############################
#
