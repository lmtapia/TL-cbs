#!/bin/bash
# usage: run-tests
# option -c only compares without running funcon terms

runfct="runfct"
fileext="tl"
lang="TL"

function run-test {
  testTitle=$1
  testNumber=$2
  testDir=$3
  echo **$testNumber
  echo "${testTitle}:" | tee ${testDir}${testTitle}.output
  echo "===== Program ====="  # | tee ${testDir}${testTitle}.output
  cat ${testDir}${testTitle}.$fileext # | tee -a ${testDir}${testTitle}.output
  echo $'\n'"===================" | tee -a ${testDir}${testTitle}.output
  ${runfct} --config ${lang}.config ${testDir}${testTitle}.fct | tee -a ${testDir}/${testTitle}.output
}
i=1
errors=0
for dir in $lang-*/;
do
  echo -e "$dir"
  for filefct in $dir*.fct;
  do
    file=$(basename $filefct  .fct)
    if [[ -z "$1" || "$1" != "-c" ]]; then
      run-test $file "Test ${i}" "$dir" 
    fi
    colordiff -q $dir${file}.output $dir${file}.output.lock
    if [[ $? != 0 ]]; then
      ((errors=errors+1))
    fi
    ((i=i+1))
  done
done
echo "***********" Failed tests: $errors/$((i - 1))
