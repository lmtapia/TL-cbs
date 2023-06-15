fun prime(x) {
  int div
  if x < 2 {
	print(false)
  }
  else {
    if  x == 2 or x == 3 {
      print(true)
    }
    else {
      div = 2 
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
  } 
}
int n 
n = 6
while n > 0 {
  n = n-1
  prime(read())
}
