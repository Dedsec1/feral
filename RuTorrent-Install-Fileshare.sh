#! /bin/bash
########################
####Define Variables####
########################
           cd ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/
           svn co -q http://svn.rutorrent.org/svn/filemanager/trunk/filemanager
           svn co -q http://svn.rutorrent.org/svn/filemanager/trunk/fileshare
           ln -s ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/fileshare/share.php ~/www/$(whoami).$(hostname -f)/public_html/
           sed "/if(getConfFile(/d" -i ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/fileshare/share.php
           sed "s|robits.org/rutorrent|$(whoami).$(hostname -f)|g" -i ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/fileshare/conf.php
           echo  "The ruTorrent Fileshare Plugin has Sucessfully been installed, Please refresh your Rutorrent page."
           wget -qO ~/Rutorrent-MainMenu.sh  https://git.io/v2Vug  && bash ~/Rutorrent-MainMenu.sh 
           ##
           
