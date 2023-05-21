#!/bin/bash

for dir in */; do
  for file in ${dir}*.output; do
    name=${file::-7}
    config=${name}.config

    echo 'tests {' > $config
    echo '  result-term:' >> $config
    echo '    '$(sed  -n "5{p;q}" $file)';' >> $config
    output=$(grep -nh Output $file | cut -d: -f1)

    if [ "$output" != "" ]; then
      echo '  standard-out:' >> $config
      output=$(grep -nh Output $file | cut -d: -f1)
      (( output = $output + 1 ))
      echo '    ['$(sed -n "$output{p;q}" $file)'];' >> $config
    fi
    echo '}' >> $config
  done
done
