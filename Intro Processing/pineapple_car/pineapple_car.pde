//Creating a car to review functions and to be used furthermore in teaching about
//Classes and Objects
void setup()
{
  size(500, 400);
}

void draw()
{
  makeACar(width-100, height/2, 6);
}

void makeACar(int x, int y, int trailers)
{
  // front trailer
  stroke(0);
  //draw the corresponding number of trailer connections
  fill(0);
  for (int i = 0; i < trailers; i++) {
    rect(x - (i*75) +15, y + 30, 35, 10);
  }
  fill(255, 0, 0);
  rect(x + 40, y - 25, 50, 75);
  fill(100, 100, 150);
  rect(x + 70, y - 25, 20, 40);
  fill(200);
  rect(x+90, y + 15, 10, 35);
  // draw the correpsonding number of pineapple trailers
  for (int i = 0; i < trailers; i++)
  {
    stroke(0);
    int xp = x - (i*75);
    //pineapple hair
    fill(10, 120, 10);
    triangle(xp -20, y -15, xp - width/6, y - height/5, xp, y - 15);
    triangle(xp - 10, y -15, xp - width/6 + 20, y - height/5, xp +10, y - 15);
    triangle(xp, y -15, xp - width/6 + 50, y - height/5, xp +20, y - 15);
    triangle(xp, y -15, xp - width/6 + 80, y - height/5, xp +20, y - 15);
    triangle(xp, y -15, xp - width/6 + 120, y - height/5, xp +20, y - 15);
    triangle(xp, y -15, xp - width/6 + 160, y - height/5, xp +20, y - 15);
    // pineapple body
    fill(255, 255, 0);
    rect(xp-25, y-25, 50, 75, 100);
    //nose
    fill(220,220,0);
    arc(xp, y+10, 10, 10, HALF_PI, 3*HALF_PI);
    //sunglasses connection
    fill(0);
    rect(xp-10, y-3, 20, 5);
    fill(100);
    rect(xp-10, y-2, 20, 2);
    //pineapple eyes
    for (int l = 0; l <5; l++)
    {
      fill(random(0, 255));
      ellipse(xp-20, y, 20-l*4, 20-l*4);
      ellipse(xp+20, y, 20-l*4, 20-l*4);
    }

    //pineapple mouth
    fill(255, 0, 0);
    rect(xp - 10, y +20, 20, 10);
    // teeth
    fill(255);
    rect(xp - 10, y +20, 20, 2);
    rect(xp - 10, y +28, 20, 2);
    // pineapple wheels
    fill(0);
    stroke(255);
    ellipse(xp - 10, y +50, 20, 20);
    ellipse(xp + 10, y +50, 20, 20);
    fill(255);
    ellipse(xp - 10, y +50, 5, 5);
    ellipse(xp + 10, y +50, 5, 5);
    
  }
  // semi wheels
  fill(0);
  stroke(255);
  ellipse(x+50, y+50, 20, 20);
  ellipse(x+80, y+50, 20, 20);
}
