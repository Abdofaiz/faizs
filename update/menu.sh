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

# Script version
SCRIPT_VERSION="1.0.0"

# Get IP address
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Get CPU and RAM info
CPU_INFO=$(lscpu | grep "Model name" | awk -F: '{print $2}' | xargs)
RAM_INFO=$(free -h | grep "Mem:" | awk '{print $2}')

# Get domain (assuming it's stored in a file or environment variable)
DOMAIN=${DOMAIN:-"example.com"}

# Get VPS installation date (assuming it's stored in a file)
INSTALL_DATE=$(cat /etc/issue | head -n 1)

clear
echo -e "$BLUE╔═══════════════════════════════════════$BLUE╗"
echo -e "$BLUE║           $ORANGE  [ Main Menu ]          $BLUE   ║"
echo -e "$BLUE╠═══════════════════════════════════════$BLUE╣"
echo -e "$BLUE║ Script Version: $SCRIPT_VERSION          $BLUE║"
echo -e "$BLUE║ IP Address: $IP_ADDRESS                  $BLUE║"
echo -e "$BLUE║ CPU: $CPU_INFO                           $BLUE║"
echo -e "$BLUE║ RAM: $RAM_INFO                           $BLUE║"
echo -e "$BLUE║ Domain: $DOMAIN                          $BLUE║"
echo -e "$BLUE║ Install Date: $INSTALL_DATE              $BLUE║"
echo -e "$BLUE╠═══════════════════════════════════════$BLUE╣"
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC 1$NC. SSH & OpenVPN Account             $BLUE║ "
echo -e "$BLUE╠➣$NC 2$NC. Vmess/Vless/Xray/Torjan Account   $BLUE║ " 
echo -e "$BLUE╠➣$NC 3$NC. Restart All Service               $BLUE║ " 
echo -e "$BLUE╠➣$NC 4$NC. Backup & Restore                  $BLUE║ " 
echo -e "$BLUE╠➣$NC 5$NC. Settings                          $BLUE║ " 
echo -e "$BLUE╠➣$NC 6$NC. Check Service                     $BLUE║ " 
echo -e "$BLUE╠➣$NC 7$NC. Exit                              $BLUE║ " 
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC Mod By Abdofaiz                      $BLUE║"
echo -e "$BLUE╠➣$NC Telegram https://t.me/vpncdn      $BLUE║"
echo -e "$BLUE╚═══════════════════════════════════════╝$NC"  
read -p "Select From Options [ 1 - 6 ] : " menu
echo -e ""
case $menu in
1)
maddssh
;;
2)
maddxray
;;
3)
sslh-fix-reboot
;;
4)
mbackup
;;
5)
msetting
;;
6)
start-menu
;;
7)
clear
exit
;;
*)
clear
menu
;;
esac
#
