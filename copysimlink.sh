#! /bin/sh

curdir=`pwd`
echo $curdir
#cd $1
find "$1" -type l -ls |while read line; do

echo "'$line'"

cd $curdir

sym=`echo $line | awk '{print $11, $13}'`


col11=`echo $sym | cut -d ' ' -f1`

col12=`echo $sym | cut -d ' ' -f2`



linkname=`echo $col11 | rev | cut -d '/' -f1 | rev`



echo "getting linkdir"


echo $col11
linkdir=`echo $col11 | awk -F'/' '{print $(NF-1)}'`


linkto=`echo $sym | cut -d ' ' -f2`


echo $linkto
echo $linkname
echo $linkdir
 

cdto="$2/$linkdir"


echo "cd to $cdto"

cd $cdto
ln -s $linkto $linknam

echo "ok..."
done
