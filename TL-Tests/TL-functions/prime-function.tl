fun prime(x,div) {
	while no (x/div * div == x)
	{
		div = div+1
	}
	if(div*div == x or div*div > x )
	{
		print(true)
	}
	else
	{
		print(false)
	}
}

prime(17,2)
prime(83,2)
prime(71,2)
prime(169,2)


