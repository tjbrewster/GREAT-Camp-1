//Shows how if statements work with mouseX
void setup()
{
  background(0);
  size(500,400);
}

void draw()
{  
  background(0);
  //If mouseX is greater than 300, we draw a rectangle
  //Otherwise, we draw a circle if mouseX is less than 300
  if(mouseX > 300)
  {
    rect(100, 100, 100, 100);
  }
  else
  {
    ellipse(100, 100, 100,100);
  }
}
