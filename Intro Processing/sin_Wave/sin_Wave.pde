float circleX = 1;
float circleY = 1;
float xDirection =1;
float time = PI;
float diameterX = 25;
float growthRate = 1;
void setup()
{
  size(500, 400);
  background(0);
}

void draw()
{
  //fill(mouseX, mouseY, mouseX);
  background(0);
  ellipse(circleX , 50*sin(time)+ height/2, 50+2*diameterX, 50+2*diameterX);
  time = time + QUARTER_PI /6;
  circleX = circleX+xDirection;//*circleX + 2*(circleX*circleX*circleX);
  //circleY = circleY;
  diameterX = diameterX + growthRate;
  if(circleX == width || circleX == 0)
  {
    fill(random(0,100),10,random(0,255));
    xDirection = xDirection *(-1);
  }
  if(diameterX <= width/10) 
  { 
    diameterX = width/10;
    growthRate = growthRate *(-1);
  }
  if(diameterX >= width *3/4)
  {
  diameterX = width *3/4;
  growthRate = growthRate *(-1);
  }
}
