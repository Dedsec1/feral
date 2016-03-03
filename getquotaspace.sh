#! /bin/bash
#################################
####Define Variables####
########################
wget -qc https://raw.githubusercontent.com/Dedsec1/feral/master/.quotaspace
mkdir -p ~/bin
wget -qO ~/bin/quota http://git.io/FolBxw
chmod 700 ~/bin/quota
source ~/.bashrc && source ~/.profile

