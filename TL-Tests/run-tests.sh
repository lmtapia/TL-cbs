#!/bin/bash
# usage: run-tests [file.fct]
# without filename runs all compatible test cases

runfct="runfct"
fileext="tl"
lang="TL"

i=1

function run-test {
  testTitle=$1
  testNumber=$2
  testDir=$3
  echo **$testNumber ${testDir}${testTitle}
  echo "${testTitle}:" | tee ${testDir}${testTitle}.output
  echo "===== Program ====="  # | tee ${testDir}${testTitle}.output
  cat ${testDir}${testTitle}.$fileext # | tee -a ${testDir}${testTitle}.output
  echo $'\n'"===================" | tee -a ${testDir}${testTitle}.output
  ${runfct} --config ${lang}.config ${testDir}${testTitle}.fct | tee -a ${testDir}${testTitle}.output
  
  ((i=i+1))
}



if [[ -n "$1" && -f $1 ]]; then
  run-test $(basename $1 .fct) "Test ${i}" $(dirname $1)/ $2
else  
  for dir in $lang-*/;
  do
    echo -e "$dir"
    for filefct in $dir*.fct;
    do
      file=$(basename $filefct .fct)
      run-test $file "Test ${i}" "$dir"
    done
  done
fi
