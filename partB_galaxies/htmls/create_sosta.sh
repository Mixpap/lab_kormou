#!/bin/bash

rm -r BUhtml
mkdir BUhtml
cp *.html ./BUhtml/

for i in  main topframe left right galaxy

do

for f in *${i}.html

do
echo "hello"
echo $f
echo ${f:3:4}


cp ./orr/ngc1357_${i}.html $f

str="${f:3:4}"
cat $f | sed -e "s/1357/${str}/" > $f.bu

cp $f.bu $f
rm *bu
done

done 

exit