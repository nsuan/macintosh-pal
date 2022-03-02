#!/bin/bash 
cd build


for i in `cat ../build.txt`; do 
../GALasm-master/src/galasm -cfp ../$i
	if [ $? -eq 0 ]; then 
		result=$(echo $i | sed -e "s#/#-#")
		cp ../$i ../builds/$result
		git add ../builds/$result
		git commit -m "Auto add after successful build $i"
	fi
done
