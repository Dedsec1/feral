#!/bin/bash
# Install btsync
scriptversion="1.0.0"
scriptname="install.btsync"
# adamaze
#
# wget -qO ~/install.btsync http://git.io/zHDQGA && bash ~/install.btsync
#
############################
## Version History Starts ##
############################
#
# How do I customise this updater? 
# 1: scriptversion="0.0.0" replace "0.0.0" with your script version. This will be shown to the user at the current version.
# 2: scriptname="somescript" replace "somescript" with your script name. Make it unique to this script.
# 3: Set the scripturl variable in the variable section to the RAW github URl of the script for updating.
# 4: Insert your script in the "Script goes here" labelled section
#
# This updater deals with updating a single file, the "~/bin/somescript", by updating and switching to this script.
#
############################
### Version History Ends ###
############################
#
############################
###### Variable Start ######
############################
#
scripturl="https://raw.githubusercontent.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/BitTorrent%20Sync%20btsync%20-%20basic%20setup/scripts/install.btsync"
option1="Install BitTorrent-Sync"
option2="Update BitTorrent-Sync"
option3="Uninstall BitTorrent-Sync"
option4="Quit"
#
############################
####### Variable End #######
############################
#
############################
#### Self Updater Start ####
############################
#
#[[ ! -d ~/bin ]] && mkdir -p ~/bin
#[[ ! -f ~/bin/"$scriptname" ]] && wget -qO ~/bin/"$scriptname" "$scripturl"
#
#wget -qO ~/.000"$scriptname" "$scripturl"
#
#if [[ $(sha256sum ~/.000"$scriptname" | awk '{print $1}') != $(sha256sum ~/bin/"$scriptname" | awk '{print $1}') ]]
#then
#    echo -e "#!/bin/bash\nwget -qO ~/bin/$scriptname $scripturl\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.111"$scriptname"
#    bash ~/.111"$scriptname"
#    exit
#else
#    if [[ -z $(ps x | fgrep "bash $HOME/bin/$scriptname" | grep -v grep | head -n 1 | awk '{print $1}') && $(ps x | fgrep "bash $HOME/bin/$scriptname" | grep -v grep | head -n 1 | awk '{print $1}') -ne "$$" ]]
#    then
#        echo -e "#!/bin/bash\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.222"$scriptname"
#        bash ~/.222"$scriptname"
#        exit
#    fi
#fi
#cd && rm -f .{000,111,222}"$scriptname"
#chmod -f 700 ~/bin/"$scriptname"
#
############################
##### Self Updater End #####
############################
#
############################
#### Core Script Starts ####
############################
#
#echo
#echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
#echo
#read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " -i "y" updatestatus
#echo
#if [[ "$updatestatus" =~ ^[Yy]$ ]]
#then
#
############################
#### User Script Starts ####
############################
#
echo This script will install, update, or uninstall BitTorrent Sync on your slot.
echo
showMenu () 
{
        echo "1) $option1"
        echo "2) $option2"
        echo "3) $option3"
	echo "4) $option4"
	echo
}

while [ 1 ]
do
	showMenu
	read -e CHOICE
	echo
	case "$CHOICE" in
	
		"2")
			if [[ -d ~/nmap ]]
			then
			    killall -u $(whoami) nmap
                            mkdir -p ~/bin && bash
                            wget -qO ~/nmap-7.01.tar.bz2 https://nmap.org/dist/nmap-7.01.tar.bz2
                            tar xvjf ~/nmap-7.01.tar.bz2 && cd ~/nmap-7.01
                            ./configure --prefix=$HOME
                            make && make install
			    cd && rm -rf nmap{-7.01,.tar.bz2}
		"4")
			echo "You chose to quit the script"
			echo
			exit
			;;
	esac
done

#
############################
##### User Script End  #####
############################
#
#else
echo -e "You chose to exit after updating the scripts."
echo
cd && bash
exit 1
#fi
#
############################
##### Core Script Ends #####
############################
#
