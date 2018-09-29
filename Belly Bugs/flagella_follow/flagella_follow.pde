float x = 50;
float xspeed;
float y = 50;
float yspeed;

void setup() {
  size(500, 500);
  //fill(100,91,55);
  //ellipse(width/2, height/2, width/3, height);
  //float randx = random(width/4, width*3/4);
  //line(randx, height/2, randx+15, height/2);
  xspeed = random(-3, 3);
  yspeed = random(-3, 3);
}

void draw() {
  background(150);
  drawBacteria(x, y);

  //Move
  x = x + xspeed;
  y = y + yspeed;

  //Wrap around the screen
  if (x > width) {
    x = 0;
  }
  if (x<0) {
    x = width;
  }
  if (y>height) {
    y = 0;
  }
  if (y < 0) {
    y = height;
  }

  //The greater the difference from mouseX/Y to x/y,
  //the greater the speed of the bacteria.
  xspeed = (mouseX-x)/70;
  yspeed = (mouseY-y)/70;
}

void drawBacteria(float x, float y) {
  //In order to keep the line in the appropriate direction of movement,
  //We must keep the distance from x/y to mouseX/mouseY, to be opposite,
  //To assure the tail will always be opposite from the mouse position.
  //The random value is just any number to determine length.
  line(x, y, x - xspeed*random(14, 18), y - yspeed * random(14, 18));
  ellipse(x, y, 30, 30);
}
