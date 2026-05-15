#! bin/bash 
var1=$(sed -n '/wardens/ = ' roster.yaml)
var2=$(sed -n '/guards/ = ' roster.yaml)
var3=$(sed -n '/bashers/ = ' roster.yaml)
var4=$(wc -l < roster.yaml)
awk 'NR=='$var1',NR=='$var2'' roster.yaml | awk '/image_url/{print$2}' | awk '{print substr($0,2,length($0)-2)}' >img1
awk 'NR=='$var2',NR=='$var3'' roster.yaml | awk '/image_url/{print$2}' | awk '{print substr($0,2,length($0)-2)}'>img2
awk 'NR=='$var3',NR=='$var4'' roster.yaml | awk '/image_url/{print$2}' | awk '{print substr($0,2,length($0)-2)}'>img3
var5=$(wc -l < img1)
var6=$(wc -l < img2)
var7=$(wc -l < img3)
for ((i=1;i<=${var5};i++))
do 
var8=$(awk -v row="$i"  'NR==row {print $0}' img1)
jp2a ${var8} --output=.wardens${i}.txt
done
for ((j=1;j<=${var6};j++))
do 
var9=$(awk -v row="$j"  'NR==row {print $0}' img2)
jp2a ${var9} --output=.guards${j}.txt
done
for ((k=1;k<=${var7};k++))
do
var10=$(awk -v row="$k"  'NR==row {print $0}' img3)
jp2a ${var10} --output=.players${k}.txt
done

