fun prime(x,div) {
	while no (x/div * div == x) {
		div = div+1
	}
	if div*div > x or div*div == x {
		print(true)
	}
	else {
		print(false)
	}
}
int n 
n = 4
while n > 0 {
  n = n-1
  prime(read(),2)
}
