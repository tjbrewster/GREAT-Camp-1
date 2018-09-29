// set up happens only once at the start!

void setup()
{
  size(500, 500);
  background(0);
  
}

//Draw loops continuously, so that something can be interactive and changing

void draw()
{
  ellipse(mouseX, mouseY, 100, 100);
}
