#!/bin/bash

fileext="tl"
lang="TL"
goal="Generate Funcons"

SpooDir="../../../cbs-beta-tools"


#java -jar ${SpooDir}/spoofax-sunshine.jar --auto-lang ${SpooDir}/include --project "$1" --builder "Generate Funcons" --build-on-all ./ --non-incremental
if [[ -z $1 || -d $1 ]]; then
	echo "Generating funcons for all .$fileext files in ./$1"
	java -jar ${SpooDir}/sunshine2.jar build -l ../${lang}-Editor -p "$1" -n "Generate Funcons" -f ".*.$fileext"
else 
	echo "Transforming single file $1"
	if [[ -n $2 ]]; then 
		goal=$2 
		# echo $goal
	fi
	java -jar ${SpooDir}/sunshine2.jar transform -l ../${lang}-Editor -i "$1" -p "$(pwd)" -n "$goal"
fi
