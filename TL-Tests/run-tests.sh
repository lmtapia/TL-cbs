#!/bin/bash

runfct="runfct"
fileext="imp"
lang="IMP"

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

echo -e "\nCoverage Tests"
for i in $(seq -w 1 9)
do
  run-test "Coverage ${i}" "Test0${i}" "Coverage"
done

echo -e "\nK-Tutorial Tests"
run-test "Sum" "sum" "K-Tutorial"
run-test "Primes" "primes" "K-Tutorial"
run-test "Collatz" "collatz" "K-Tutorial"
