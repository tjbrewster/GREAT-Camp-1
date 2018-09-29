float x = 10;
float y = 10;
float speed = 1;
boolean downpressed = false;
boolean rightpressed = false;
boolean leftpressed = false;
boolean uppressed = false;

void setup() {
  size(500, 500);
  fill(0);
  ellipse(width/2, height/2,  100, 100);
}  

void draw() {
  if (downpressed) {
    y = y + speed;
  }
  if (rightpressed) {
    x = x + speed;
  }
  if(leftpressed){
     x = x - speed; 
  }
  if(uppressed){
     y = y -speed; 
  }
  
  if(x<0){
     x = 0;
  }
  if(x>width){
     x = width; 
  }
 fill(255);
  ellipse(x, y, 10, 10);
  gravity();
}

void keyPressed() {
  if (key == 's') {
    downpressed = true;
  }
  if (key == 'd') {
    rightpressed = true;
  } else if (key == 'w') {
    uppressed = true;
  } else if(key == 'a'){
    leftpressed = true;
  }
}

void keyReleased() {
  if (key == 's') {
    downpressed = false;
  }
  if (key == 'd') {
    rightpressed = false;
  } else if (key == 'w')
  {
    uppressed = false;
  } else if(key == 'a'){
     leftpressed = false; 
  }
}

void gravity()
{
  if(x < width/2 && x > 100)
  {
    x = x  + .25;
  }
  if( x >width/2 && x < width/2 +100)
  {
    x = x   - .25;
  }
  if( y <height/2 && y > height/2 -100)
  {
    y = y   + .25;
  }
  if( y >height/2 && y < height/2 +100)
  {
    y = y   - .25;
  }
}
