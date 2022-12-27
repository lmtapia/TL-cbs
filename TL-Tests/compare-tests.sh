lang="TL"
i=0
errors=0
for dir in $lang-*/;
do
  echo -e "$dir"
  for file in $dir*.output;
  do 
    #cp $file ${file}.lock

    colordiff -y -q $file ${file}.lock
    if [[ $? != 0 ]]; then
       ((errors=errors+1))
    fi
    
    ((i=i+1))
  done
done
echo "***********" Tests failed: $errors/$i