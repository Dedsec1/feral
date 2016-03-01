#!/bin/bash
#
############################
##### Basic Info Start #######
##############################
#
# Script Author: Dedsec
#
# Script Contributors: 
#
# License: This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License. https://creativecommons.org/licenses/by-sa/4.0/
#
# Bash Command for easy reference:
#
# wget -qO ~/Toolkit.sh https://git.io/v2anV  && bash ~/Toolkit.sh
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
    # put your version changes in the single quotes and then uncomment the line.
    #
    echo '1.0.0 RTM
    #
    echo
    exit
fi
#
############################
### Version History Ends ###
###########################
#
############################
###### Variable Start ######
############################
#
# Script Version number is set here.
scriptversion="2.0"
#
# Script name goes here. Please prefix with install.
scriptname="Feral-Toolkit"
#
# Author name goes here.
scriptauthor="Dedsec"
#
# Contributor's names go here.
contributors="None credited"
#
# Set the http://git.io/ shortened URL for the raw github URL here:
gitiourl="http://git.io/eJySww"
#
# Don't edit: This is the bash command shown when using the info option.
gitiocommand="wget -qO ~/$scriptname $gitiourl && bash ~/$scriptname"
#
# This is the raw github url of the script to use with the built in updater.
scripturl="https://raw.githubusercontent.com/Dedsec1/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/scripts/htpasswdtk.sh"
#
# This will generate a 20 character random passsword for use with your applications.
apppass="$(< /dev/urandom tr -dc '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' | head -c20; echo;)"
# This will generate a random port for the script between the range 10001 to 49999 to use with applications. You can ignore this unless needed.
appport="$(shuf -i 10001-49999 -n 1)"
#
# This wil take the previously generated port and test it to make sure it is not in use, generating it again until it has selected an open port.
while [[ "$(netstat -ln | grep ':'"$appport"'' | grep -c 'LISTEN')" -eq "1" ]]; do appport="$(shuf -i 10001-49999 -n 1)"; done
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
makeissue=".makeissue $scriptname A description of the issue"
ticketurl="https://www.feralhosting.com/manager/tickets/new"
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
updaterenabled="0"
#
############################
####### Variable End #######
##########################
#
############################
###### Function Start ######
############################
#
showMenu () 
{
    echo -e "\033[32m""Feral Toolkit Menus""\e[0m"
    #
    echo -e "\033[31m""1""\e[0m" "Slot Diagonsis Tools" "\033[36m""""\e[0m" """\e[0m"
    #
    echo -e "\033[31m""2""\e[0m" "Software Installation Tools" "\033[36m""""\e[0m" ""
    #
    echo -e "\033[31m""3""\e[0m" "Load the Htpasswd toolkit"\033[36m""""\e[0m"
    #
    echo -e "\033[31m""4""\e[0m"  "Rutorrent Client Configuration Tools"\033[36m""""\e[0m"
    #
    echo -e "\033[31m""5""\e[0m" "" "\033[36m""""\e[0m" "" "\033[36m""""\e[0m"
    #   
    echo -e "\033[31m""6""\e[0m" "" "\033[36m""""\e[0m" ""
    #
    echo -e "\033[31m""7""\e[0m" "\033[1;30m""""\e[0m" "" "\033[36m""""\e[0m"
    #
    echo -e "\033[31m""8""\e[0m" "\033[1;30m""""\e[0m" ""
    #
    echo -e "\033[31m""9""\e[0m" "\033[1;30m""""\e[0m" ""
    #
    echo -e "\033[31m""10""\e[0m" "\033[1;30m""""\e[0m" """\e[0m" "directory using" "\033[36m""""\e[0m"
    #
    echo -e "\033[31m""11""\e[0m" "\033[1;30m""""\e[0m" "" "\033[36m""""\e[0m" ""
    #
    echo -e "\033[32m""""\e[0m"
    #
    echo -e "\033[31m""12""\e[0m" "" "\033[36m""""\e[0m" """\e[0m" "" "\033[33m""""\e[0m"
    #
    echo -e "\033[31m""13""\e[0m" "" "\033[36m""""\e[0m" "" "\033[36m""""\e[0m" "" "\033[33m""""\e[0m"
    #
    echo -e "\033[31m""14""\e[0m" "" "\033[36m""""\e[0m" "" "\033[33m""""\e[0m"
    #
    echo -e "\033[32m""""\e[0m"
    #
    echo -e "\033[31m""15""\e[0m" """\e[0m" "" "\033[36m""""\e[0m"
    #
    echo -e "\033[31m""16""\e[0m" "" "\033[36m""""\e[0m" "" "\033[36m""""\e[0m"
    #
    echo -e "\033[31m""17""\e[0m" "" "
    #
    echo -e "\033[32m""""\e[0m"
    #
    echo -e "\033[31m""18""\e[0m" "\033[1;30m"":""\e[0m" ""
    #
    echo -e "\033[31m""19""\e[0m" "\033[1;30m""""\e[0m" ""
    #
    echo -e "\033[31m""20""\e[0m" "\033[1;30m""""\e[0m" "" "\033[36m""""\e[0m" ""
    #
    echo -e "\033[31m""21""\e[0m" " "" "
    #
    echo -e "\033[31m""22""\e[0m" "\033[32m""Quit""\e[0m"
}
#
############################
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
    echo -e "Put your help instructions or script guidance here"
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
    echo -e "These are the recommended ways to report bugs for scripts in the FAQs:"
    echo
    echo -e "1: In IRC you can use wikibot to create a github issue by using this command format:"
    echo
    echo -e "\033[36m""$makeissue""\e[0m"
    echo
    echo -e "2: You could open a ticket describing the problem with details of which script and what the problem is."
    echo
    echo -e "\033[36m""$ticketurl""\e[0m"
    echo
    echo -e "3: You can create an issue directly on github using your github account."
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
# Quick Run option part 1: If qr is used it will create this file. Then if the script also updates, which would reset the option, it will then find this file and set it back.
if [[ ! -z "$1" && "$1" = 'qr' ]] || [[ ! -z "$2" && "$2" = 'qr' ]];then echo -n '' > ~/.quickrun; fi
#
# No Update option: This disables the updater features if the script option "nu" was used when running the script.
if [[ ! -z "$1" && "$1" = 'nu' ]] || [[ ! -z "$2" && "$2" = 'nu' ]]
then
    echo
    echo "The Updater has been temporarily disabled"
    echo
    scriptversion="$scriptversion-nu"
else
    #
    # Check to see if the variable "updaterenabled" is set to 1. If it is set to 0 the script will bypass the built in updater regardless of the options used.
    if [[ "$updaterenabled" -eq "1" ]]
    then
        [[ ! -d ~/bin ]] && mkdir -p ~/bin
        [[ ! -f ~/bin/"$scriptname" ]] && wget -qO ~/bin/"$scriptname" "$scripturl"
        #
        wget -qO ~/.000"$scriptname" "$scripturl"
        #
        if [[ "$(sha256sum ~/.000"$scriptname" | awk '{print $1}')" != "$(sha256sum ~/bin/"$scriptname" | awk '{print $1}')" ]]
        then
            echo -e "#!/bin/bash\nwget -qO ~/bin/$scriptname $scripturl\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.111"$scriptname"
            bash ~/.111"$scriptname"
            exit
        else
            if [[ -z "$(pgrep -fu "$(whoami)" "bash $HOME/bin/$scriptname")" && "$(pgrep -fu "$(whoami)" "bash $HOME/bin/$scriptname")" -ne "$$" ]]
            then
                echo -e "#!/bin/bash\ncd && rm -f $scriptname{.sh,}\nbash ~/bin/$scriptname\nexit" > ~/.222"$scriptname"
                bash ~/.222"$scriptname"
                exit
            fi
        fi
        cd && rm -f .{000,111,222}"$scriptname"
        chmod -f 700 ~/bin/"$scriptname"
        echo
    else
        echo
        echo "The Updater has been disabled"
        echo
        scriptversion="$scriptversion-DEV"
    fi
fi
#
# Quick Run option part 2: If quick run was set and the updater section completes this will enable quick run again then remove the file.
if [[ -f ~/.quickrun ]];then updatestatus="y"; rm -f ~/.quickrun; fi
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
############################
#
    echo -e "\033[32m""Hello $(whoami).""\e[0m" "This is the htpasswd user and password toolkit." "\e[0m"
    echo -e "\033[33m""This toolkit is designed to complement the FAQ and it is not a replacement for the FAQ""\e[0m"
    echo
    #
    ###
    #
    ###### Start of functions attached to menu items
    while [ 1 ]
    do
        showMenu
        echo
        read -ep "Enter the number of the action you wish to complete: " CHOICE
        echo
        case "$CHOICE" in
    ##########
            "1") # load submenu
            wget -qO ~/submenu.sh https://git.io/v2as4  && bash ~/submenu.sh
                ;;
    ##########
            "2") # load install menu
               wget -qO ~/install-menu.sh https://git.io/v2oEw  && bash ~/install-menu.sh
                ;;
    ##########
            "3") # Load the Htpasswd toolkit 
                  wget -qO ~/htpasswdtk.sh http://git.io/eJySww && bash ~/htpasswdtk.sh
                fi
                ;;
    ##########
            "4") # Load Rutorrent Menu 
                 wget -qO ~/RuTorrent-Menu.sh  https://git.io/v2Vug  && bash ~/RuTorrent-Menu.sh
                ;;
    ##########
            "5") # 
                
                ;;
    ##########
            "6") # 
                
                ;;
    ##########
            "7") # 
               
                ;;
    ##########
            "8") #
               
                ;;
    ##########
            "9") # 
                
                ;;
    ##########
            "10") # 
                
                ;;
    ##########
            "11") # 
                
                ;;
    ##########
            "12") # 
                
                ;;
    ##########
            "13") # 
                
                ;;
    ##########
            "14") # 
               
                ;;
    ##########
            "15") # 
                
                ;;
    ##########
            "16") # 
               
                ;;
    ##########
            "17") # 
               
                ;;
    ##########
            "18") # 
               
                ;;
    ##########
            "19") # 
                
                ;;
    ##########
            "20") # 
               
                ;;
    ##########
            "21") # 
               
                ;;
    ##########
            "22") # Quit
                exit
                ;;
    ##########
        esac
    done
#
############################
##### User Script End  #####
############################
#
else
echo
cd && bash
exit
fi
#
############################
##### Core Script Ends #####
############################
#
#
