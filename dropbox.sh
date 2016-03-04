#!/bin/bash
wget -qO ~/dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64" && tar -xzf dropbox.tar.gz
wget -qO ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py" && chmod 700 ~/bin/dropbox.py
source ~/.bashrc && source ~/.profile
rm -f ~/dropbox.tar.gz
break
#
