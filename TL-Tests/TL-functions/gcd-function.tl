int x,y
 
fun gcd(a,b,aux)
{
  while b>0
  {	aux = b
	b = a - (a/b) * b
	a = aux	
  } 
  a
}

x = 1071
y = 462

print(gcd(x,y))
print(gcd(360,139))