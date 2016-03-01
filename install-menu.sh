#!/bin/bash
#
###################################################
##### Basic Info Start ######################
#######################################
#
# Script Author: Dedsec
#
# Script Contributors: none
#
# Bash Command for easy reference:
#
# wget -qO ~/Menu.sh https://git.io/v2as4  && bash ~/Menu.sh

#
# The MIT License (MIT)
#
# Copyright (c) 2016 randomessence
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
##
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
############################
###### Basic Info End ######
############################
#
############################
#### Script Notes Start ####
############################
#
##
#
############################
##### Script Notes End #####
############################
#
############################
## Version History Starts ##
############################
#
if [[ ! -z "$1" && "$1" = 'changelog' ]]
then
    echo
    #
    echo 'v1.1.6 - And he tooketh the holy hammer and hit it until it wath fixeth.'
    echo 'v1.0.9 - deluge restart'
    echo 'v1.0.8 - tweak to rtorrent restart to check for orphaned lock file.'
    echo 'v1.0.7 - rtorrent and deluge will no longer kill custom instances from the multirtru script. Transmision restart timer imeplemented. Other minor tweaks'
    echo 'v1.0.6 - Template updated'
    echo 'v1.0.5 - Template updated'
    #
    echo
    exit
fi
#
############################
### Version History Ends ###
############################
#
############################
###### Variable Start ######
############################
#
# Script Version number is set here.
scriptversion="2.0.1"
#
# Script name goes here. Please prefix with install.
scriptname="Software_menu"
#
# Author name goes here.
scriptauthor="Dedsec"
#
# Contributor's names go here.
contributors="None credited"
#
# Set the http://git.io/ shortened URL for the raw github URL here:
gitiourl="http://git.io/5Uw8Gw"
#
# Don't edit: This is the bash command shown when using the info option.
gitiocommand="wget -qO ~/$scriptname $gitiourl && bash ~/$scriptname"
#
# This is the raw github url of the script to use with the built in updater.
scripturl="https://raw.githubusercontent.com/Dedsec1/feral/master/install-menu.sh"
#
# This will generate a 20 character random passsword for use with your applications.
apppass="$(< /dev/urandom tr -dc '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' | head -c20; echo;)"
# This will generate a random port for the script between the range 10001 to 32001 to use with applications. You can ignore this unless needed.
appport="$(shuf -i 10001-32001 -n 1)"
#
# This wil take the previously generated port and test it to make sure it is not in use, generating it again until it has selected an open port.
while [[ "$(netstat -ln | grep ':'"$appport"'' | grep -c 'LISTEN')" -eq "1" ]]; do appport="$(shuf -i 10001-32001 -n 1)"; done
#
# Script user's http www URL in the format http://username.server.feralhosting.com/
host1http="http://$(whoami).$(hostname -f)/"
# Script user's https www URL in the format https://username.server.feralhosting.com/
host1https="https://$(whoami).$(hostname -f)/"
# Script user's http www url in the format https://server.feralhosting.com/username/
host2http="http://$(hostname -f)/$(whoami)/"
# Script user's https www url in the format https://server.feralhosting.com/username/
host2https="https://$(hostname -f)/$(whoami)/"
#
# feralwww - sets the full path to the default public_html directory if it exists.
[[ -d ~/www/"$(whoami)"."$(hostname -f)"/public_html ]] && feralwww="$HOME/www/$(whoami).$(hostname -f)/public_html/"
# rtorrentdata - sets the full path to the rtorrent data directory if it exists.
[[ -d ~/private/rtorrent/data ]] && rtorrentdata="$HOME/private/rtorrent/data"
# deluge - sets the full path to the deluge data directory if it exists.
[[ -d ~/private/deluge/data ]] && delugedata="$HOME/private/deluge/data"
# transmission - sets the full path to the transmission data directory if it exists.
[[ -d ~/private/transmission/data ]] && transmissiondata="$HOME/private/transmission/data"
#
# Bug reporting varaibles.
gitissue="https://github.com/feralhosting/feralfilehosting/issues/new"
#
############################
## Custom Variables Start ##
############################
#
##
#
############################
### Custom Variables End ###
############################
#
# Disables the built in script updater permanently by setting this variable to 0.
updaterenabled="1"
#
############################
####### Variable End #######
############################
#
############################
###### Function Start ######
############################
#
showMenu () 
{
    echo "1"": Install AutoDL-irssi"
    echo "2"": Install Bittorrent Sync"
    echo "3"": Install CouchPotato"
    echo "4"": Install Flexget"
    echo "5"": Install Java"
    echo "6"": Install Mosh"
    echo "7"": Install Murmur"
    echo "8"": Install Plex"
    echo "9"": Install Madsonic"
    echo "10"":Install Sickrage"
    echo "11"":Install Subsonic"
    echo "12"": "Quit"
}
#
###########################
####### Function End #######
############################
#
############################
#### Script Help Starts ####
############################
#
if [[ ! -z "$1" && "$1" = 'help' ]]
then
    echo
    echo -e "\033[32m""Script help and usage instructions:""\e[0m"
    echo
    #
    ###################################
    ##### Custom Help Info Starts #####
    ###################################
    #
    echo "To troubleshoot rtorrent not starting you should do this:"
    echo
    echo -e "Use the command: rtorrent"
    #
    ###################################
    ###### Custom Help Info Ends ######
    ###################################
    #
    echo
    exit
fi
#
############################
##### Script Help Ends #####
############################
#
############################
#### Script Info Starts ####
############################
#
# Use this to show a user script information when they use the info option with the script.
if [[ ! -z "$1" && "$1" = 'info' ]]
then
    echo
    echo -e "\033[32m""Script Details:""\e[0m"
    echo
    echo "Script version: $scriptversion"
    echo
    echo "Script Author: $scriptauthor"
    echo
    echo "Script Contributors: $contributors"
    echo
    echo -e "\033[32m""Script options:""\e[0m"
    echo
    echo -e "\033[36mhelp\e[0m = See the help section for this script."
    echo
    echo -e "Example usage: \033[36m$scriptname help\e[0m"
    echo
    echo -e "\033[36mchangelog\e[0m = See the version history and change log of this script."
    echo
    echo -e "Example usage: \033[36m$scriptname changelog\e[0m"
    echo
    echo -e "\033[36minfo\e[0m = Show the script information and usage instructions."
    echo
    echo -e "Example usage: \033[36m$scriptname info\e[0m"
    echo
    echo -e "\033[31mImportant note:\e[0m Options \033[36mqr\e[0m and \033[36mnu\e[0m are interchangeable and usable together."
    echo
    echo -e "For example: \033[36m$scriptname qr nu\e[0m or \033[36m$scriptname nu qr\e[0m will both work"
    echo
    echo -e "\033[36mqr\e[0m = Quick Run - use this to bypass the default update prompts and run the main script directly."
    echo
    echo -e "Example usage: \033[36m$scriptname qr\e[0m"
    echo
    echo -e "\033[36mnu\e[0m = No Update - disable the built in updater. Useful for testing new features or debugging."
    echo
    echo -e "Example usage: \033[36m$scriptname nu\e[0m"
    echo
    echo -e "\033[32mBash Commands:\e[0m"
    echo
    echo -e "\033[36m""$gitiocommand""\e[0m"
    echo
    echo -e "\033[36m""~/bin/$scriptname""\e[0m"
    echo
    echo -e "\033[36m""$scriptname""\e[0m"
    echo
    echo -e "\033[32m""Bug Reporting:""\e[0m"
    echo
    echo -e "You can create an issue directly on github using your github account."
    echo
    echo -e "\033[36m""$gitissue""\e[0m"
    echo
    echo -e "\033[33m""All bug reports are welcomed and very much appreciated, as they benefit all users.""\033[32m"
    #
    echo
    exit
fi
#
############################
##### Script Info Ends #####
############################
#
############################
#### Self Updater Start ####
############################
#
# Checks for the positional parameters $1 and $2 to be reset if the script is updated.
[[ ! -z "$1" && "$1" != 'qr' ]] || [[ ! -z "$2" && "$2" != 'qr' ]] && echo -en "$1\n$2" > ~/.passparams
# Quick Run option part 1: If qr is used it will create this file. Then if the script also updates, which would reset the option, it will then find this file and set it back.
[[ ! -z "$1" && "$1" = 'qr' ]] || [[ ! -z "$2" && "$2" = 'qr' ]] && echo -n '' > ~/.quickrun
# No Update option: This disables the updater features if the script option "nu" was used when running the script.
if [[ ! -z "$1" && "$1" = 'nu' ]] || [[ ! -z "$2" && "$2" = 'nu' ]]; then
    scriptversion="$scriptversion-nu"
    echo -e "\nThe Updater has been temporarily disabled\n"
else
    # Check to see if the variable "updaterenabled" is set to 1. If it is set to 0 the script will bypass the built in updater regardless of the options used.
    if [[ "$updaterenabled" -eq "1" ]]; then
        [[ ! -d ~/bin ]] && mkdir -p ~/bin
        [[ ! -f ~/bin/"$scriptname" ]] && wget -qO ~/bin/"$scriptname" "$scripturl"
        wget -qO ~/.000"$scriptname" "$scripturl"
        if [[ "$(sha256sum ~/.000"$scriptname" | awk '{print $1}')" != "$(sha256sum ~/bin/"$scriptname" | awk '{print $1}')" ]]; then
            echo -e "#!/bin/bash\nwget -qO ~/bin/$scriptname $scripturl\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.111"$scriptname" && bash ~/.111"$scriptname"; exit
        else
            if [[ -z "$(pgrep -fu "$(whoami)" "bash $HOME/bin/$scriptname")" && "$(pgrep -fu "$(whoami)" "bash $HOME/bin/$scriptname")" -ne "$$" ]]; then
                echo -e "#!/bin/bash\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.222"$scriptname" && bash ~/.222"$scriptname"; exit
            fi
        fi
        cd && rm -f .{000,111,222}"$scriptname" && chmod -f 700 ~/bin/"$scriptname"
        echo
    else
        scriptversion="$scriptversion-DEV"
        echo -e "\nThe Updater has been disabled\n"
    fi
fi
# Quick Run option part 2: If quick run was set and the updater section completes this will enable quick run again then remove the file.
[[ -f ~/.quickrun ]] && updatestatus="y"; rm -f ~/.quickrun
# resets the positional parameters $1 and $2 post update.
[[ -f ~/.passparams ]] && set "$1" "$(sed -n '1p' ~/.passparams)" && set "$2" "$(sed -n '2p' ~/.passparams)"; rm -f ~/.passparams
#
############################
##### Self Updater End #####
############################
#
############################
#### Core Script Starts ####
############################
#
if [[ "$updatestatus" = "y" ]]
then
    :
else
    echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
    echo
    read -ep "The script has been updated, enter [y] to continue or [q] to exit: " -i "y" updatestatus
    echo
fi
#
if [[ "$updatestatus" =~ ^[Yy]$ ]]
then
#
############################
#### User Script Starts ####
###########################
#
while [ 1 ]
do
    showMenu
    echo
    read -ep "Enter the number of the action you wish to complete: " CHOICE
    case "$CHOICE" in
        "1")
            echo
            wget -qO ~/install.autodl.sh http://git.io/oTUCMg && bash ~/install.autodl.sh
            echo  "if you see the following error: 
            Error downloading files. Make sure autodl-irssi is started and configured properly (eg. password, port number): 
            Error getting files listing: Error: Could not connect: (111) Connection refused."
            echo "You simply need to run this menu choice again to apply the fix.
            Important note: This will not delete or change any of your configured settings. It will just update autodl and apply the fix."
            break
            ;;
        "2")
            ##
            echo "Installing Bittorrent Sync on your slot"
            wget -qO ~/install.btsync http://git.io/zHDQGA && bash ~/install.btsync
            break
            ;;
        "3")
            ##
            echo "Please Wait:Installing  CouchPotato"
            wget -qO ~/install.couchpotato http://git.io/3_iozg && bash ~/install.couchpotato
            echo "CouchPotato has Finished installing: please visit your server url to continue the CouchPotato Setup.
            https://server.feralhosting.com/username/couchpotato"
            break
            ;;
        "4")
            echo "Please Wait:Doing some pre requisite tasks for Flexget"
            pip uninstall virtualenv
            cd && rm -rf .local/bin/virtualenv{,-2.7}
            echo "Installing Flexget"
            pip install --user virtualenv
            ~/.local/bin/virtualenv ~/flexget/
            ~/flexget/bin/pip install flexget
            echo"Doing pre-post install error checking"
            pip install --user --no-use-wheel virtualenv
            echo "Running Flexget to make it runs ok"
            ~/flexget/bin/flexget
            echo" Doing one more Flexget test"
            flexget
            break
            ;;
        "5")
            echo "Please Wait: Installing Java 1.8"
            wget -qO ~/java.tar.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=111681
            tar xf ~/java.tar.gz --strip-components=1 -C ~/
            ~/bin/java -version
            echo "Checking Java Install"
            java -version
            break
            ;;
        "6")
            echo "Please Wait: Installing Mosh"
            wget -qO ~/protobuf-2.5.0.tar.gz http://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz
            tar xf ~/protobuf-2.5.0.tar.gz && cd ~/protobuf-2.5.0
            ./configure --prefix=$HOME && make && make install
            cd && rm -rf  protobuf{-2.5.0.tar.gz,-2.5.0}
            echo "Installing Mosh"
            wget -qO ~/mosh-1.2.4.tar.gz http://mosh.mit.edu/mosh-1.2.4.tar.gz
            tar xf ~/mosh-1.2.4.tar.gz && cd ~/mosh-1.2.4
            ./configure --prefix=$HOME PKG_CONFIG_PATH=$HOME/lib/pkgconfig LDFLAGS="--static" 
            make
            make install
            cd && rm -rf  mosh{-1.2.4.tar.gz,-1.2.4}
            echo "Testing Mosh"
            mosh username@server.feralhosting.com --server=~/bin/mosh-server
            break
            ;;
        "7")
            echo "Please Wait: Installing Murmur"
            wget -qO ~/install.murmur http://git.io/-mVd3g && bash ~/install.murmur
            ~/murmur/murmurd
            echo "Testing Murmur"
            ~/murmur/murmurd -ini ~/murmur/murmur.ini
            break
            ;;
        "8")
            echo "Please Wait: Installing Plex"
            curl https://gist.githubusercontent.com/feralhosting/ed3321cdebf8a59d47a5/raw/979f8b1d042c9ed20d2db0f9705b8a6df4133bdf/meteor.sh | sh 
            echo "Checking Meteor Version"
            meteor --version 
            echo "Installing Plex Requests"
            git clone https://github.com/lokenx/plexrequests-meteor.git ~/.plexrequests
            cd ~/.plexrequests
            screen -S plexrequests meteor --port 31244
            echo"Press CTRL + A + D on your keyboard to detach screen. And Plex Requests is will be installed and running on this address : 
            http://username.server.feralhosting.com:portnumber"
            break
            ;;
        "9")
            echo "Starting Madsonic Setup"
            wget -qO ~/install.madsonic http://git.io/Eq97bg && bash ~/install.madsonic
            break
            ;;
        "10")
            echo "Starting Sickrage Setup "
            wget -qO ~/install.subsonic http://git.io/bGZT && bash ~/install.subsonic
            break
            ;;
        "11")
            echo "Starting Subsonic Setup "
            wget -qO ~/install.subsonic http://git.io/bGZT && bash ~/install.subsonic
            break
            ;;
        "12")
            echo "Quit"
            exit
            break
            ;;
           
    esac
done
#
############################
##### User Script End  #####
############################
#
else
    echo -e "You chose to exit after updating the scripts."
    echo
    cd && bash
    exit
fi
#
############################
##### Core Script Ends #####
###########################
#
#
