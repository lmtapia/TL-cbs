#!/bin/bash

fileext="tl"
lang="TL"

SpooDir="../../../cbs-beta-tools"

echo "Generating funcons for all .$fileext files in ./$1"
#java -jar ${SpooDir}/spoofax-sunshine.jar --auto-lang ${SpooDir}/include --project "$1" --builder "Generate Funcons" --build-on-all ./ --non-incremental
<<<<<<< HEAD
java -jar ${SpooDir}/sunshine2.jar build -l ../${lang}-Editor/target -p "$1" -n "Generate Funcons"
=======
java -jar ${SpooDir}/sunshine2.jar build -l ../${lang}-Editor/target -p "$1" -n "Generate Funcons"
>>>>>>> b7a67fa (var calling works, updated TL-Editor)
