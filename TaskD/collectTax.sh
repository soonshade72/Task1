#! bin/bash
var7=$(wc -l < tv1.txt)
for ((k=1;k<=${var7};k++))
do 
var10=$(awk -v row="$k"  'NR==row {print $0}' tv1.txt)
VAR=$(sudo du -hc /home/bashers/${var10} | grep total | awk {'print$1'})
VARR=$(echo ${VAR::-1})
TI=5120
if [ "$VARR" -gt "$TI" ]; then 
echo -n "|" >>tax.log
ls -ltr /home/bashers/${var10} | awk  'NR==2 {printf$8}' >>tax.log
echo -n "|" >>tax.log
echo -n ${var10} >>tax.log
echo -n "|" >>tax.log
ls -ltr /home/bashers/${var10} | awk -n 'NR==2 {printf$5}' >>tax.log
echo -n "|" >>tax.log
ls -ltr /home/bashers/${var10} | awk -n 'NR==2 {print$9}' >>tax.log
fi
done 

