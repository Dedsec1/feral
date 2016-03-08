show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Option1 ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Option2 ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Option3 ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Option4 ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} Sub Menu 1 ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt

  while [ opt != '' ]
  do
    if [[ $opt = "" ]]; then
      exit;
    else
      case $opt in
      1) clear;
      option_picked "Option 1 Picked";
      show_menu;
      ;;

      2) clear;
      option_picked "Option 2 Picked";
      show_menu;
      ;;

      3) clear;
      option_picked "Option 3 Picked";
      echo "test" 
      show_menu;
      ;;

      4) clear;
      option_picked "Option 4 Picked";
      show_menu;
      ;;
      5) clear;
      option_picked "Sub Menu 1";
      sub_menu1;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Pick an option from the menu";
      show_menu;
      ;;
      esac
    fi
  done
}

function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

sub_menu1(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Sub Option1 ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Sub Option2 ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Sub menu option 1";
      echo "test"
      sub_menu_admin;
      ;;

      2) clear;
      option_picked "Sub menu option 2";
      echo "test" 
      sub_menu_admin;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Pick an option from the menu";
      sub_menu1;
      ;;
      esac
    fi
  done
}

clear
show_menu
