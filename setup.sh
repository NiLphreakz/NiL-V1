#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);
#Email domain
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo -e ""
echo -e "   \e[1;32mPlease enter your email Domain/Cloudflare."
echo -e "   \e[1;31m(Press ENTER for default email)\e[0m"
read -p "   Email : " email
default=${default_email}
new_email=$email
if [[ $email == "" ]]; then
sts=$default_email
else
sts=$new_email
fi
# email
mkdir -p /usr/local/etc/xray/
touch /usr/local/etc/xray/email
echo $sts > /usr/local/etc/xray/email
echo ""
mkdir /var/lib/premium-script;
echo -e "\e[1;32mPlease enter your subdomain/domain. If not, please press enter."
read -p "Recommended (Subdomain): " host
echo "IP=" >> /var/lib/premium-script/ipvps.conf
echo $host > /root/domain
echo -e ""
mkdir -p /usr/local/etc/xray/
echo ""
echo -e "\e[1;32mPlease enter the name of provider."
read -p "Name : " nm
echo $nm > /root/provided
echo ""
clear
echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
sleep 2
wget https://raw.githubusercontent.com/NiLphreakz/NiL-V1/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo -e "\e[0;32mDONE INSTALLING SSH & OVPN\e[0m"
clear
#install Xray
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/NiLphreakz/NiL-V1/main/install/ins-xray.sh && chmod +x ins-xray.sh && screen -S ins-xray ./ins-xray.sh
echo -e "\e[0;32mDONE INSTALLING XRAY CORE\e[0m"
clear
#install Trojan GO
echo -e "\e[0;32mINSTALLING TROJAN GO...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/NiLphreakz/NiL-V1/main/install/trojan-go.sh && chmod +x trojan-go.sh && screen -S trojan-go ./trojan-go.sh
echo -e "\e[0;32mDONE INSTALLING TROJAN GO\e[0m"
clear
#install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/NiLphreakz/NiL-V1/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "\e[0;32mDONE INSTALLING SET-BR...\e[0m"
clear
rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/trojan-go.sh
rm -f /root/set-br.sh
# Colour Default
echo "1;36m" > /etc/banner
echo "30m" > /etc/box
echo "1;31m" > /etc/line
echo "1;32m" > /etc/text
echo "1;33m" > /etc/below
echo "47m" > /etc/back
echo "1;35m" > /etc/number
echo 3d > /usr/bin/test
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=========================[Script By NiLphreakz]========================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ----------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Tcp Xtls     : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 8443"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 8442"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI TROJAN]"  | tee -a log-install.txt
echo "    ------------------" | tee -a log-install.txt
echo "   - Xray Trojan Tcp Tls     : 443"  | tee -a log-install.txt
echo "   - Trojan Go               : 2083"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI CLASH FOR ANDROID (YAML)]"  | tee -a log-install.txt
echo "    -----------------------------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Yaml      : Yes"  | tee -a log-install.txt
echo "   --------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo "=========================[Script By NiLphreakz]========================" | tee -a log-install.txt
clear
echo ""
echo ""
echo -e "    \e[1;32m.------------------------------------------.\e[0m"
echo -e "    \e[1;32m|     SUCCESFULLY INSTALLED THE SCRIPT     |\e[0m"
echo -e "    \e[1;32m'------------------------------------------'\e[0m"
echo ""
echo -e "   \e[1;32mSERVER WILL AUTOMATICALLY REBOOT IN 10 SECONDS\e[0m"
rm -r setup.sh
sleep 10
reboot
