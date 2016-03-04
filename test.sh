#! /bin/bash
########################
####Define Variables####
########################
mkdir -p ~/spideroak
wget -qO ~/spideroak.deb 'https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64'
dpkg-deb -x ~/spideroak.deb ~/spideroak
cp -rf ~/spideroak/usr/bin/. ~/spideroak
rm -rf ~/spideroak/etc ~/spideroak/usr ~/spideroak.deb
########################
#
sed -i "3iSPIDEROAK_ROOT=$(ls -d $HOME/spideroak)\n" ~/spideroak/SpiderOakONE
sed -i 's|LD_LIBRARY_PATH="/opt|LD_LIBRARY_PATH="$SPIDEROAK_ROOT/opt|g' ~/spideroak/SpiderOakONE
sed -i 's|QT_PLUGIN_PATH="/opt|QT_PLUGIN_PATH="$SPIDEROAK_ROOT/opt|g' ~/spideroak/SpiderOakONE
sed -i 's|exec "/opt|exec "$SPIDEROAK_ROOT/opt|g' ~/spideroak/SpiderOakONE
#

