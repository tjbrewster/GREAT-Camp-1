PImage img;
void setup()
{
  
  img = loadImage("Ironman2.jpg");
  size(1300, 800);
  img.resize(1300, 800);

  //image(img, 0, 0);
  //background(img);

  noStroke();
}

void draw()
{
  float size = map(mouseX, 0, width , 1 , 16);
  //img.get(0,0);
  for (int i = 0; i < 800; i++)
  {
    int x, y;

    x = int(random(width));
    y = int(random(height));

    color c = img.get(x, y);

    fill(red(c),green(c),blue(c));

    ellipse(x, y, size, size);
  }
}