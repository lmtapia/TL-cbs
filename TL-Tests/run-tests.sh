#!/bin/bash

runfct="runfct"
fileext="tl"
lang="TL"

function run-test {
  testTitle=$1
  testName=$2
  testDir=$3
  echo "Test ${testTitle}:"
  echo "===== Program =====" > ${testDir}/${testName}.output
  cat ${testDir}/${testName}.$fileext >> ${testDir}/${testName}.output
  echo "===================" >> ${testDir}/${testName}.output
  ${runfct} --config ${lang}.config ${testDir}/${testName}.fct >> ${testDir}/${testName}.output
}

for dir in .;
do
  echo -e "\nCoverage Tests"
  for file in .;
  do
    run-test "Coverage ${i}" "Test0${i}" "Coverage" 
  done
done
