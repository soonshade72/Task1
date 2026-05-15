#! bin/bash 
var1=$(sed -n '/wardens/ = ' roster.yaml)
sudo addgroup wardens
var2=$(sed -n '/guards/ = ' roster.yaml)
sudo addgroup guards
var3=$(sed -n '/bashers/ = ' roster.yaml)
sudo addgroup bashers
var4=$(wc -l < roster.yaml)
awk 'NR=='$var1',NR=='$var2'' roster.yaml | awk '/username/{print$3}' | awk '{print substr($0,2,length($0)-2)}' >array1
awk 'NR=='$var2',NR=='$var3'' roster.yaml | awk '/username/{print$3}' | awk '{print substr($0,2,length($0)-2)}'>array2
awk 'NR=='$var3',NR=='$var4'' roster.yaml | awk '/username/{print$3}' | awk '{print substr($0,2,length($0)-2)}'>array3
var5=$(wc -l < array1)
var6=$(wc -l < array2)
var7=$(wc -l < array3)
for ((i=1;i<=${var5};i++))
do 
var8=$(awk -v row="$i"  'NR==row {print $0}' array1)
WARDEN="warden$i"
sudo adduser "${WARDEN}" --disabled-password --gecos "${var8}" --system --ingroup wardens --home /home/wardens/${var8} 
echo "${WARDEN}:1234" | sudo chpasswd
sudo chsh -s /bin/bash ${WARDEN}
done
for ((j=1;j<=${var6};j++))
do 
GUARDS="guards$j"
var9=$(awk -v row="$j"  'NR==row {print $0}' array2)
sudo adduser "${GUARDS}" --disabled-password --gecos "${var9}" --system --ingroup guards --home /home/guards/${var9}
echo "${GUARDS}:1234" | sudo chpasswd
sudo chsh -s /bin/bash ${GUARDS}
done
for ((k=1;k<=${var7};k++))
do 
PLAYERS="players$k"
var10=$(awk -v row="$k"  'NR==row {print $0}' array3)
sudo adduser "${PLAYERS}" --disabled-password --gecos "${var10}" --system --ingroup bashers --home /home/bashers/${var10}
sudo echo "${PLAYERS}:1234" | sudo chpasswd
sudo chsh -s /bin/bash ${PLAYERS}
zina="DropZone$k"
sudo mkdir /home/bashers/${var10}/${zina}
done

