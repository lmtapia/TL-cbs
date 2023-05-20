lang=TL
ext=tl

for dir in ${lang}-*/;   do     
  spt_module=${dir::-1}.spt
  printf "module ${dir::-1} \nlanguage $lang \nstart symbol Start\n" > $spt_module
  n=0
  for filelang in $dir*.$ext; do 
    file=$(basename $filelang .tl)       
    printf '\ntest %s %s %s\n' ${dir::-1} $file [[ >> $spt_module
    cat $filelang >> $spt_module
    printf '\n]] transform \"Generate Funcons\" to\n\"' >> $spt_module 
    sed 's#\"#\\\"#g' $dir$file.fct >> $spt_module
    printf '\"' >> $spt_module
    if [ -n $? ]; then ((n=n+1)); fi
  done
  echo $n 'tests migrated to the module' $spt_module  
done

