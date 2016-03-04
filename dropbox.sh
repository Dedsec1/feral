#!/bin/bash

wget -O ~/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py"
chmod 755 ~/dropbox.py
wget -O dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64"
tar -xvzf dropbox.tar.gz
chmod 755 ~/.dropbox-dist/dropboxd
~/.dropbox-dist/dropboxd
break
#
