#!/bin/bash
var=$(wc -l < tv1.txt)
for ((i=1;i<=${var};i++))
do
  var1=$(awk -v rel="$i" 'NR==rel{print$0}' tv1.txt)
  Path="/home/bashers/${var1}/.bash_history"
  WardenPath="/home/wardens/${var1}.txt"
  P=0
  while read -r User ; do
    if echo "$User" | grep -qf /home/yash/Desktop/RS1.txt ; then 
      P=$((P+1));
      echo "$User" | sudo tee -a "$WardenPath" > /dev/null
    fi
if echo "$User" | grep -qf /home/yash/Desktop/RS2.txt ; then 
P=$((P+2));
echo "$User" | sudo tee -a "$WardenPath" > /dev/null
fi
done < <(sudo cat "$Path" 2>/dev/null) 
Q=5
if [ "$P" -gt "$Q" ] ; then
sudo chsh -s /bin/rbash ${var1}
echo "sudo chsh -s /bin/bash ${var1}" | at now + 30 minutes
sudo cat /dev/null | sudo tee "$Path" > /dev/null
fi
done
