var7=$(wc -l < tv1.txt)
for ((k=1;k<=${var7};k++))
do 
var10=$(awk -v row="$k"  'NR==row {print $0}' tv1.txt)
var=$(awk  -F'|' -v search="$var10" '$3 ==search {sum += $4} END { print sum }'  tax.log)
echo  ${var10}-${var}
done
