fun mod(x,d) { x - x/d * d}
fun even(a){ mod(a,2) == 0}

int a
a = even(6)
print(a)
a