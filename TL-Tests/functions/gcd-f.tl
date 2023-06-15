int x,y
 
fun gcd(a,b,aux) {
  while b>0 {
  	aux = b
	  b = a - (a/b) * b
	  a = aux		  
  } 
  a
 
}

x = read()
y = read()
print(gcd(x,y,0))

gcd(read(),read(),0)

