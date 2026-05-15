#!/bin/bash
rm -rf /home/bashers/*
rmdir /home/yash/Desktop/opt/Bashrot_Vault
sudo setfacl -m g:guards:rwx opt/Bashrot_Vault
sudo setfacl -m g:wardens:rwx opt/Bashrot_Vault
sudo setfacl -m g:bashers:--- opt/Bashrot_Vault
sudo setfacl -m g:bashers:--x opt/Bashrot_Vault/.hidden_dir
