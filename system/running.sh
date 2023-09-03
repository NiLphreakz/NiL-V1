#!/bin/bash
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi
MYIP=$(wget -qO- icanhazip.com);
# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
REGION=$( curl -s ipinfo.io/region )
#clear
COUNTRY=$( curl -s ipinfo.io/country )
#clear
WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
REGION=$( curl -s ipinfo.io/region )
#clear
WAKTUE=$( curl -s ipinfo.io/timezone )
#clear
koordinat=$( curl -s ipinfo.io/loc )

# TOTAL RAM
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
swap=$( free -m | awk 'NR==4 {print $2}' )

#clear
NC='\033[0m'
echo -e "$NC"

# Tipe Processor
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion

# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Kernel Terbaru
kernelku=$(uname -r)

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS Patch
tipeos2=$(uname -m)

# Getting Domain Name
Domen="$(cat /usr/local/etc/xray/domain)"
# Echoing Result
echo -e "\e[32mloading...\e[0m"
clear
echo -e ""
echo -e "Your VPS Information :"
echo -e "\e[0;32mSCRIPT VPS BY NiLphreakz\e[0m"
echo "-----------------------------------------------------------"
echo "Operating System Information :"
echo -e "VPS Type    : $typevps"
echo -e "OS Arch     : $tipeos2"
echo -e "Hostname    : $HOSTNAME"
echo -e "OS Name     : $Tipe"
echo -e "OS Version  : $Versi_OS"
echo -e "OS URL      : $URL_SUPPORT"
echo -e "OS BASE     : $basedong"
echo -e "OS TYPE     : Linux / Unix"
echo -e "Bash Ver    : $versibash"
echo -e "Kernel Ver  : $kernelku"
echo "-----------------------------------------------------------"
echo "Hardware Information :"
echo -e "Processor   : $tipeprosesor"
echo -e "Proc Core   : $totalcore"
echo -e "Virtual     : $typevps"
echo -e "Cpu Usage   : $cpu_usage"
echo "-----------------------------------------------------------"
echo "System Status / System Information :"
echo -e "Uptime      : $uptime ( From VPS Booting )"
echo -e "Total RAM   : $tram MB"
echo -e "Used RAM    : $uram MB"
echo -e "Avaible RAM : $fram MB"
echo -e "Download    : $downloadsize GB ( From Startup/VPS Booting )"
echo -e "Upload      : $uploadsize GB ( From Startup/VPS Booting )"
echo "-----------------------------------------------------------"
echo "Internet Service Provider Information :"
echo -e "Public IP   : $MYIP"
echo -e "Domain      : $Domen"
echo -e "ISP Name    : $NAMAISP"
echo -e "Region      : $REGION "
echo -e "Country     : $COUNTRY"
echo -e "City        : $CITY "
echo -e "Time Zone   : $WAKTUE"
echo "-----------------------------------------------------------"
echo "Time & Date & Location & Coordinate Information :"
echo -e "Location    : $COUNTRY"
echo -e "Coordinate  : $koordinat"
echo -e "Time Zone   : $WAKTUE"
echo -e "Date        : $harini"
echo -e "Time        : $jam ( WIB )"
echo "-----------------------------------------------------------"
echo -e ""
echo -e "              \e[0;32m[\e[1;36mSYSTEM STATUS INFORMATION\e[0;32m]\e[0m"
echo -e "             \e[0;34m=============================\e[0m"
echo -e ""
echo -e "\e[1;33mSTATUS XRAY:\e[0m"
echo -e "\e[0;34m-------------\e[0m"
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Ws Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Ws Tls       : "$red"not running (Error)"$NC" "
fi
status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Ws None Tls  : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Ws None Tls  : "$red"not running (Error)"$NC" "
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Ws Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Ws Tls       : "$red"not running (Error)"$NC" "
fi
status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Ws None Tls  : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Ws None Tls  : "$red"not running (Error)"$NC" "
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Tcp Xtls     : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Tcp Xtls     : "$red"not running (Error)"$NC" "
fi
echo -e ""
echo -e "\e[1;33mSTATUS TROJAN GO:\e[0m"
echo -e "\e[0;34m-----------------\e[0m"
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Tcp         : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan Tcp         : "$red"not running (Error)"$NC" "
fi
status="$(systemctl show trojan-go.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Trojan Go               : "$green"running"$NC" ✓"
else
echo -e " Trojan Go               : "$red"not running (Error)"$NC" "
fi
echo -e ""
echo -e "\e[1;33mSTATUS NGIX:\e[0m"
echo -e "\e[0;34m--------------------\e[0m"
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx                   : "$green"running"$NC" ✓"
else
echo -e " Nginx                   : "$red"not running (Error)"$NC" "
fi
echo -e "\e[0;34m-----------------------------------------------------------\e[0m"
echo -e ""
echo -e "${green}JIKA TERDAPAT NOT RUNNING, PLEASE REPORT TO ADMIN FOR FIX$NC"
echo -e "${green}Report to Telegram @NiLphreakz$NC"