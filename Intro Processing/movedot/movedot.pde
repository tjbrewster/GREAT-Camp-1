int xPos = 200;
int yPos = 200;

void setup()
{
  background(125, 50, 200);
  size(500, 400);
}

void draw()
{
  background(125, 50, 200);
  arrows();
  collision();
  ellipse(xPos, yPos, 50, 50);
}

//Tests for collision with the borders of the screen
void collision() {
  if (xPos>width-25) {
    xPos = width-25;
  }
  if (xPos<25) {
    xPos = 25;
  }
  if (yPos>height-25) {
    yPos = height-25;
  }
  if (yPos<25) {
    yPos = 25;
  }
}

//Teaching the use of keycodes
void arrows()
{
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        yPos = yPos -10;
      }
      if (keyCode == DOWN)
      {
        yPos = yPos + 10;
      }
      if (keyCode == LEFT)
      {
        xPos = xPos - 10;
      }
      if (keyCode == RIGHT)
      {
        xPos = xPos + 10;
      }
    }
  }
}

void keyPressed()
{

  arrows();
}

void keyReleased()
{
}
