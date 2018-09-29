float circleHeight = 0; //y value of ellipse
float circleX = 0; //x value of ellipse
float circleDirectionX = 5; //x speed/direction
float circleDirectionY = 5; //y speed/direction
float circleSize = 50; //size of circle
void setup()
{
  background(0);
  size(1000, 800);
}


void draw()
{
  ellipse(circleX, circleHeight, circleSize, circleSize);
  
  //Change the y value by taking the circleHeight and adding the y direction to it
  circleHeight = (circleHeight + circleDirectionY);
  //Changing x value by adding x direction to circleX
  circleX = circleX +circleDirectionX;
  
  //If the circle hits the bottom or top of the screen
  if(circleHeight == height || circleHeight == 0)
  {
    //Choose a random color and "bounce" off the edge by changing the yDirection to negative
    fill(random(0,255),random(0,255), random(0,255));
    circleDirectionY = circleDirectionY * -1;
  }
  //If the circle hits the right or left side of the screen
  if(circleX == width || circleX == 0)
  {
    //Choose a random color and "bounce" off the edge by changing the xDirection to negative
    fill(random(0,255),random(0,255), random(0,255));
    circleDirectionX = circleDirectionX * -1;
  }
  circleSize = random(50,200);
}
