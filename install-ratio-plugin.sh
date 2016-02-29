#! /bin/bash
########################
####Define Variables####
########################
cd ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/
wget -qO feralstats.zip http://git.io/nB1WyA
unzip -qo feralstats.zip && rm -f feralstats.zip
echo  "The Feral Stats Plugin has Sucessfully been installed, Please refresh your Rutorrent page to verify the plugin is working."
#

