//Drawing a pineapple, and teaching the use of functions without parameters
void setup()
{
  size(500,400);
  background(0);
}

void draw()
{
  drawAPineapple();
}

void drawAPineapple()
{
  //Leaves
  fill(10, 120, 10);
  triangle(width/2 -20, height/2 -15, width/2 - width/6, height/2 - height/5, width/2, height/2 - 15);
  triangle(width/2 - 10, height/2 -15, width/2 - width/6 + 20, height/2 - height/5, width/2 +10, height/2 - 15);
  triangle(width/2, height/2 -15, width/2 - width/6 + 50, height/2 - height/5, width/2 +20, height/2 - 15);
  triangle(width/2, height/2 -15, width/2 - width/6 + 80, height/2 - height/5, width/2 +20, height/2 - 15);
  triangle(width/2, height/2 -15, width/2 - width/6 + 120, height/2 - height/5, width/2 +20, height/2 - 15);
  triangle(width/2, height/2 -15, width/2 - width/6 + 160, height/2 - height/5, width/2 +20, height/2 - 15);
  //Pineapple
  fill(255,255,0);
  rect(width/2-25, height/2-25, 50, 75,100);
}
