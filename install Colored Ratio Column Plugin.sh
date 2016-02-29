#! /bin/bash
########################
####Define Variables####
########################
wget -qO ~/ratio.zip http://git.io/71cumA
unzip -qo ~/ratio.zip -d ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/
cd && rm -f ratio.zip
echo  "The Colored Ratio Column Plugin has Sucessfully been installed, Please refresh your Rutorrent page to see the changes."
wget -qO ~/Rutorrent-MainMenu.sh  https://git.io/v2Vug  && bash ~/Rutorrent-MainMenu.sh 
##
