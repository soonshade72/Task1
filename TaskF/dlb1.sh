#!/bin/bash
var=$(wc -l < tv1.txt)

for ((k=1;k<=${var};k++))
do
total=10
var1=$(awk -v t="$k" 'NR==t{print$0}' tv1.txt | tr -d '\r')
awk -F'|' -v nm="$var1" '$3==nm {print$2}' sh.log | tr -dc '0-9:\n' > ts.txt
var2=$(wc -l < ts.txt)
for ((i=1;i<${var2};i++))
do
var3=$(awk -F':' -v l="$i" 'NR==l{print$1}' ts.txt)
varb=$((i+1))
var4=$(awk -F':' -v li="$varb" 'NR==li{print$1}') ts.txt
if [ -z "$var3" ] || [ -z "$var4" ]; then 
continue 
fi
if [ "$var3" -eq "$var4" ]; then 
var5=$(awk -F':' -v l="$i" 'NR==l{print$2}' ts.txt)
var6=$(awk -F':' -v li="$varb" 'NR==li{print$2}' ts.txt)
var7=$(( 10#${var6:-0} - 10#${var5:-0} ))
if [ "$var7" -le 5 ]; then 
total=$((total * 5));
fi
fi
if [ "$var4" -eq $(( 10#${var3:-0} + 1 )) ]; then
var8=$(awk -F':' -v l="$i" 'NR==l{print$2}' ts.txt)
var9=$(awk -F':' -v li="$varb" 'NR==li{print$2}' ts.txt)
var10=$(( 10#${var9:-0} - 10#${var8:-0} + 60 ))
if [ "$var10" -le 5 ]; then 
total=$((total * 5 ));
fi
fi
done
var11=$(date +%T)
var12=$(awk -v r="$var2" 'NR==r{print$0}' ts.txt)
    
echo "${var11}" > ts.txt
echo "${var12}" >> ts.txt
    
var13=$(awk -F':' 'NR==1{print$1}' ts.txt)
var14=$(awk -F':' 'NR==1{print$2}' ts.txt)
var15=$(awk -F':' 'NR==1{print$3}' ts.txt)
var16=$(awk -F':' 'NR==2{print$1}' ts.txt)
var17=$(awk -F':' 'NR==2{print$2}' ts.txt)
var18=$(awk -F':' 'NR==2{print$3}' ts.txt)
    
var13=$((10#${var13:-0} * 3600))
var14=$((10#${var14:-0} * 60))
var19=$((var13 + var14 + 10#${var15:-0}))
    
var16=$((10#${var16:-0} * 3600))
var17=$((10#${var17:-0} * 60))
var20=$((var16 + var17 + 10#${var18:-0}))
    
var21=$((var20 - var19))
var22=$(awk -v f="$var21" 'BEGIN{if(f>0) print 1-log(f);else print 0 }')
var23=$(awk -v t="$total" -v v="$var22" 'BEGIN{print t*v}')
    
total=$((total + ${var23%.*}))
var24=$(awk -F'|' -v g="$var" 'NR==g{print$3}' sh.log | tr -d '\r')
    
if [ "${var24:-0}" = "${var1:-0}" ]; then 
        total=$((total+500))
fi
echo "$total - $var1" >> dlb.log
done
sudo setfacl -m g:guards:rwx dlb.log
sudo setfacl -m g:wardens:rwx dlb.log
