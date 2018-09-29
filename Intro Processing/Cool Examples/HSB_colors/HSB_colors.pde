void setup()
{
  size(600,600);
  colorMode(HSB);
  background(0);
}

float x = width/2;
float y = height/2;
void draw()
{
  
 for(int i = 0; i < 50; i++)
 {
   x = random(width);
   y = random(height);
   
   fill(dist(x,y,width/2,height/2) % 361 , 255, 255);
   ellipse(x,y, 5 , 5);
 }
 
}