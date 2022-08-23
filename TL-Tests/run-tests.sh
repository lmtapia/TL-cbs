#!/bin/bash

runfct="runfct"
fileext="tl"
lang="TL"

function run-test {
  testTitle=$1
  testNumber=$2
  testDir=$3
  echo "**$testNumber ${testTitle}:"
  echo "===== Program =====" | tee ${testDir}${testTitle}.output
  cat ${testDir}${testTitle}.$fileext | tee -a ${testDir}${testTitle}.output
  echo $'\n'"===================" | tee -a ${testDir}${testTitle}.output
  ${runfct} --config ${lang}.config ${testDir}${testTitle}.fct | tee -a ${testDir}/${testTitle}.output
}
i=1
for dir in $lang-*/;
do
  echo -e "$dir"
  for file in $dir*.fct;
  do
    run-test $(basename $file  .fct) "Test0${i}" "$dir" 
    ((i=i+1))
  done
done

#for v in *.txt ; do mv $v  $(basename $v  .txt); done