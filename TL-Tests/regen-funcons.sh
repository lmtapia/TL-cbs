#!/bin/bash

fileext="tl"
lang="TL"
goal="Generate Funcons"
editor="../${lang}-Editor"
sunshine="$editor/sunshine2.jar"

while getopts "f:n:l:" option
do
  case "$option" in
    n) goal="$OPTARG" ;;
    f) from="$OPTARG" ;;
  esac 
done

if [[ "$from" == "" || -d "$from" ]]; then
	echo "$goal for all .$fileext files in ./$from"
	java -jar $sunshine build -l $editor -p "$from" -n "$goal" -f ".*.$fileext"
elif [[ -f "$from" ]]; then
	echo "Transforming single file $from"
	java -jar $sunshine transform -l $editor -i "$from" -p "." -n "$goal"
else 
	echo "$from doesn't exist"
fi
