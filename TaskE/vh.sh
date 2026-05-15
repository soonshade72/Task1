#!/bin/bash
var=$(wc -l < tv1.txt)
for ((k=1;k<=${var};k++))
do
var1=$(awk -v  rl="$k" 'NR==rl{print$0}' tv1.txt)
inotifywait -m /home/bashers/${var1}/DropZone$k -e close_write | 
while read -r path event fn; do
pathname="${path}${fn}"
while read -r User ; do 
if grep -q "$User" /home/yash/Desktop/Slang.txt; then
wall "Successful Heist by ${var1}"
echo " $(date +%D) | $(date +%T)|${var1}" >> /home/yash/Desktop/Heist.log
break 
fi
done < "$pathname"
done &
done
wait

