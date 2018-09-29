
void setup()
{
  size(500, 400);
  background(0);
}

void draw()
{
  //Calling functions with parameters
  drawACat(100, 100);

  drawACat(300, 300);
}

//Teaching about functions with/without parameters
void drawACat(int x,int y)
{
  if(mousePressed){
     fill(0,0,255); 
  }
  //Ears
  triangle(x  - 50, height/2 - 150, x - 75, height/2 - 50, x - 25, height/2 - 75);
  triangle(x  + 50, height/2 - 150, x + 75, height/2 - 50, x + 25, height/2 - 75);
  
  //Head
  ellipse(x, height/2, 200, 200);
  
  //Nose
  rect(x -25, height/2 - 12, 50, 25);
  
  //Eyes
  ellipse(x - 50, height/2 - 50, 50, 50);
  ellipse(x + 50, height/2 -50, 50, 50);
  
}

void mousePressed() {
}

void keyPressed() {
  fill (255, 0, 0);
  if (key == 'a') {
    fill (0, 0, 255);
  }
}
