fun mod(a,b) { a - a/b * b}
fun mult(a,b,c){  
  while a > 0 {
    if mod(a,2) > 0 {
      c = c + b
    } else {} 
    a = a/2
    b = b*2
  }
  c
}

print( mult(read(),read(),0) )
mult(read(),read(),0)