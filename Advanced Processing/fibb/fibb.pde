
void setup()
{
  print(fibonacci(100));
  fill(0);
  //text(str(fibonacci(10)),width/2,height/2);
}

int fibonacci(int iter)
{
  int fibonacci = 0;
  if (iter == 1|| iter == 2) {
    fibonacci = 1;
    println(fibonacci);
    return fibonacci;
  } else {
     fibonacci =  fibonacci(iter-1) + fibonacci(iter-2);
     println(fibonacci);
    return fibonacci;
  }
}
