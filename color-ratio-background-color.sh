#! /bin/bash
#########################
####Define Variables####
########################
cd ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/
wget -qO ratiocolor.zip http://git.io/PiSq_g && unzip -qo ratiocolor.zip
cp -rf rutorrent-ratiocolor-master/. ratiocolor && rm -rf rutorrent-ratiocolor-master ratiocolor.zip
cd
echo  "The Colored Ratio Column Plugin (Background Colour) Version has installed, Please refresh your Rutorrent page."
wget -qO ~/test1.sh  https://git.io/v2Vug  && bash ~/test1.sh 
##

