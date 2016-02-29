#! /bin/bash
########################
####Define Variables####
########################
           cd ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/
           svn co -q http://svn.rutorrent.org/svn/filemanager/trunk/mediastream
           svn co -q http://svn.rutorrent.org/svn/filemanager/trunk/filemanager
           mkdir ~/www/$(whoami).$(hostname -f)/public_html/stream
           ln -s ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/mediastream/view.php ~/www/$(whoami).$(hostname -f)/public_html/stream/
           sed -i "s|'http://mydomain.com/stream/view.php';|'http://$(whoami).$(hostname -f)/stream/view.php';|g" ~/www/$(whoami).$(hostname -f)/public_html/rutorrent/plugins/mediastream/conf.php
           echo  "The ruTorrent Mediashare Plugin has Sucessfully been installed, Please refresh your Rutorrent page."
           wget -qO ~/Rutorrent-MainMenu.sh  https://git.io/v2Vug  && bash ~/Rutorrent-MainMenu.sh 
           ##
           
