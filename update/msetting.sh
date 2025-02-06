#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"

# Source the bot configuration
source update/bot_config.sh

# Function to send a message via Telegram Bot
send_telegram_message() {
    local chat_id="$1"
    local message="$2"
    curl -s -X POST "https://api.telegram.org/bot${BOT_API_TOKEN}/sendMessage" \
        -d chat_id="${chat_id}" \
        -d text="${message}"
}

# Function to update bot configuration
update_bot_config() {
    read -p "Enter new Bot API Token: " new_token
    read -p "Enter new Default Chat ID: " new_chat_id
    echo -e "#!/bin/bash\n# Bot Configuration\n\nBOT_API_TOKEN=\"$new_token\"\nDEFAULT_CHAT_ID=\"$new_chat_id\"" > update/bot_config.sh
    echo -e "${OK} Bot configuration updated."
}

clear
echo -e "$BLUE╔═══════════════════════════════════════$BLUE╗"
echo -e "$BLUE║           $ORANGE ✶ Setting Menu ✶        $BLUE   ║"
echo -e "$BLUE╠═══════════════════════════════════════$BLUE╣"
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC 1$NC. Change Domain                     $BLUE║ "
echo -e "$BLUE╠➣$NC 2$NC. Add Cloudfront Domain             $BLUE║ "
echo -e "$BLUE╠➣$NC 3$NC. Change Port SSH WS SSL/TLS   $BLUE     ║ " 
echo -e "$BLUE╠➣$NC 4$NC. Change Port SSH WS Non-TLS   $BLUE     ║ " 
echo -e "$BLUE╠➣$NC 5$NC. Change Port OVPN             $BLUE     ║ " 
echo -e "$BLUE╠➣$NC 6$NC. Set Limit Speed             $BLUE      ║ " 
echo -e "$BLUE╠➣$NC 7$NC. Check Bandwith Server       $BLUE      ║ " 
echo -e "$BLUE╠➣$NC 8$NC. Rennew Cert                 $BLUE      ║ " 
echo -e "$BLUE╠➣$NC 9$NC. Manage Telegram Bot         $BLUE      ║ " 
echo -e "$BLUE╠➣$NC 10$NC. Update Bot Config          $BLUE      ║ " 
echo -e "$BLUE╠➣$NC 11$NC. Back to Menu               $BLUE      ║ " 
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╚═══════════════════════════════════════╝$NC"  
read -p "Select From Options [ 1 - 11 ] : " menu
echo -e ""
case $menu in
1)
addhost
;;
2)
cfnhost
;;
3)
portsshws
;;
4)
portsshnontls
;;
5)
portopvn
;;
6)
limitspeed
;;
7)
vnstat
;;
8)
certsslh
;;
9)
# Example: Send a message to a specific chat
read -p "Enter Chat ID: " chat_id
read -p "Enter Message: " message
send_telegram_message "$chat_id" "$message"
;;
10)
update_bot_config
;;
11)
clear
menu
;;
*)
clear
msetting
;;
esac
#
