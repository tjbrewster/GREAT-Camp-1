
void setup()
{
  noFill();
  size(500, 500);
  stroke(255, 0, 0, 100);
}

void draw() {
  if(frameCount%120 == 0){
      background(0);
  tree(width/2, height, height/3, color(random(0, 255), random(0, 255), random(0, 255), 100));
  tree(width/2, height, height/3, color(random(0, 255), random(0, 255), random(0, 255), 100));
  tree(width/2, height, height/3, color(random(0, 255), random(0, 255), random(0, 255), 100));
  }
}

void keyPressed() {
  background(0);
  tree(width/2, height, height/3, color(random(0, 255), random(0, 255), random(0, 255), 100));
}

void serpinskiSquare(int level, int x, int y, int size)
{
  if (level == 1)
  {
    rect(x, y, size, size);
  } else
  {
    float randsize;
    randsize = random(size/5, size/1.5);
    serpinskiSquare(level-1, (int)random(x, x+size-randsize), (int)random(y, y+size-randsize), (int)randsize);
    randsize = random(size/5, size/1.5);
    serpinskiSquare(level-1, (int)random(x, x+size-randsize), (int)random(y, y+size-randsize), (int)randsize);
    rect(x, y, size, size);
  }
}

void tree(float xpos, float ypos, float thisheight, int c) {
  float newx = xpos + random(-thisheight, thisheight);
  float newy = ypos - random(thisheight*2/3, thisheight*4/3);
  float cv = 50;
  int newcolor = color((red(c) + random(-cv, cv))%255, (green(c) + random(-cv, cv))%255, (blue(c) + random(-cv, cv))%255, 100);
  strokeWeight(thisheight/20);
  stroke(newcolor);
  line(xpos, ypos, newx, newy);
  if (thisheight>2) {

    tree(newx, newy, thisheight/2, newcolor);
    for (int i = 0; i<10; i++) {
      if (random(0, 1)>0.8) {
        tree(newx, newy, thisheight/2, newcolor);
      }
    }
  }
}
