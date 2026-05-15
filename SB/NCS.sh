#!/bin/bash
while true; do
find / -type d 2>/dev/null | shuf -n 6767 | while read -r loct ; do 
sudo ln -s "${loct}"  "/home/yash/Desktop/opt/Bashrot_Vault/${loct//\//_}"
done
var=$(ls /home/yash/Desktop/opt/Bashrot_Vault | shuf -n 1)
sudo cp /home/yash/Desktop/opt/Bashrot_Vault/code.txt "/home/yash/Desktop/opt/Bashrot_Vault/${var}/code.txt"
sleep 2700
done &


 
