#!/bin/bash
# usage: run-tests [-c <CONFIG>] [-o <OPTIONS>] [-f <FILE|DIR>] 
# without options runs all funcons files each one with its config

runfct="runfct-TL"
opt_runfct=
langext=tl

while getopts "c:o:f:" option
do
  case "$option" in
    c) output=true
       config="--config ${OPTARG}";;
    o) opt_runfct="${OPTARG}";;
    f) from="${OPTARG}";;
  esac 
done

i=1
errors=0
names= 
function run-test {
  test=$1
  name=${test::-4}
  echo '*** Test' $i $test
  if [ "$output" == "true" ]; then 
    echo $(basename "${name}")":" | tee ${name}.output
    echo '===== Program ====='  
    cat ${name}.${langext} 
    echo $'\n''===================' | tee -a ${name}.output
    $runfct $config $test | tee -a ${name}.output
  else
    $runfct $opt_runfct $test | tee ${name}.temp
    lines=$(wc -l ${name}.temp| cut -d ' ' -f 1)
    if [[ $? != 0 || $lines -gt 0 ]]; then 
      names="$names $name"
      ((errors=errors+1))
    fi
    lines=0
    rm ${name}.temp
  fi  
  
  ((i=i+1))

}

if [[ -f $from ]]; then run-test $from; exit; fi
if [[ -d $from ]]; then dir=$from; else dir=.; fi    
 
for file in $(find $dir -name '*.fct'); do 
  run-test $file; 
done
echo '*********** Failed tests:' $errors/$((i - 1)) "$names"
