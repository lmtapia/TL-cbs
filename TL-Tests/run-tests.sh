#!/bin/bash
# usage: run-tests [file.fct] [-c] 
# without filename runs all compatible test cases
# option -c only compares without running funcon terms

runfct="runfct"
fileext="tl"
lang="TL"
dTool="colordiff --strip-trailing-cr"

$dTool --help &> /dev/null
if [[ $? != 0 ]]; then
  dTool="diff --strip-trailing-cr" 
fi

i=1
errors=0

function run-test {
  testTitle=$1
  testNumber=$2
  testDir=$3
  echo **$testNumber ${testDir}${testTitle}
  if [[ -z "$4" || "$4" != "-c" ]]; then
    echo "${testTitle}:" | tee ${testDir}${testTitle}.output
    echo "===== Program ====="  # | tee ${testDir}${testTitle}.output
    cat ${testDir}${testTitle}.$fileext # | tee -a ${testDir}${testTitle}.output
    echo $'\n'"===================" | tee -a ${testDir}${testTitle}.output
    ${runfct} --config ${lang}.config ${testDir}${testTitle}.fct | tee -a ${testDir}${testTitle}.output
  fi
  $dTool ${testDir}${testTitle}.output ${testDir}${testTitle}.output.lock
  if [[ $? != 0 ]]; then
    ((errors=errors+1))
  fi
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
      run-test $file "Test ${i}" "$dir" $1
    done
  done
fi
echo "***********" Failed tests: $errors/$((i - 1))
