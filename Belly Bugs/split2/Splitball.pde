class Splitball {
  float size;
  float xpos;
  float ypos;

  Splitball(float x, float y, float ballsize)
  {
    size = ballsize;
    xpos = x;
    ypos = y;
  }

  //draws the ellipse, and increases in size
  void display()
  {
    ellipse(xpos, ypos, size, size);
    size = size + 1;
  }
}
