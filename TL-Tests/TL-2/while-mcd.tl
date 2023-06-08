int a,b,c
a = 1071
b = 462

while b>0
{	c = b
	b = a - (a/b) * b
	a = c
	print(b)
}
print(a)
