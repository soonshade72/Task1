#! bin/bash
sed -i -f pattern.txt Slang.txt
while true ; do 
shuf -n 1 Slang.txt | base64 > code.txt
sudo mv code.txt  ~/Desktop/opt/Bashrot_Vault
sleep 30 
sudo rm -r ~/Desktop/opt/Bashrot_Vault/code.txt
done
