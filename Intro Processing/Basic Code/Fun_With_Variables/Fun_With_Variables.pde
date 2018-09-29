float i = 0;
void setup()
{
  background(0);
  size(500, 400);
  
}
void draw()
{
  background(0);
  i += 10;
  ellipse(mouseX, mouseY, 200 , 200 );
  fill(mouseX, mouseY, i);
  if(mousePressed)
  {
   fill(i %255);
  }
}
