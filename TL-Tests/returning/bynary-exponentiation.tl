fun binpow(a,b) {
  int res
  if b == 0 {return 1} else {}
  res = binpow(a,b/2)
  if mod(b,2) > 0 {
    return res*res*a
  } else {
    return res*res
  }  
}

fun mod(x,d) { x - x/d * d}
 
 
print(binpow(read(),read()))
