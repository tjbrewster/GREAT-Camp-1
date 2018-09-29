boolean circle = false;
boolean rectangle = false;
boolean line = false;
void setup()
{
  background(255);
  size(1000 , 500);
  
}

void draw()
{
   if(key == 'b')
  {
   fill(0,0,255);
   stroke(0,0,255);
  }
  if(key == 'g')
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
  }
  if(key == 'y')
  {
    fill(#FFED4B);
    stroke(#FFED4B);
  }
  
  if(key == 'r')
  {
    rectangle = true;
    line = false;
    circle = false;
  }
  else if (key == 'c')
  {
    rectangle = false;
    line = false;
    circle = true;
  }
  
  else if (key == 'l')
  {
    rectangle = false;
    line = true;
    circle = false;
  }
  
  //Draw When the Mouse is pressed :D
  if(mousePressed)
  {
    if(circle)
    {
    ellipse(mouseX,mouseY,100,100);
    }
    else if(rectangle)
    {
      rect(mouseX - 50, mouseY - 50, 100, 100);
    }
    else
    {
      
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
}
