void setup() {
  size(500, 500);
  //Uses a nested for loop to create rows and columns of random faces
  for (int y = 0; y < 600; y = y + 125)
  {
    for (int x = 0; x<5; x=x+1) {
      randomface(x*100, y);
    }
  }
}

void draw() {
}

void randomface(int xpos, int ypos)
{
  //rng to determine how hats and eyes will look
  int hat = (int) random(0, 2);
  int eyes = (int) random(0, 2);

  //rng to determine the dimensions of the head
  float headWidth = random(70, 90);
  float headHeight = random(70, 100);

  //rng to determine happy face or sad face
  float happy = random(0, 1);

  //random color for head and eyes
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xpos + 50, ypos + 50, headWidth, headHeight);
  fill(random(0, 255), random(0, 255), random(0, 255));

  if (eyes == 1)
  {
    //Rectangle eyes
    rect(xpos+random(20, 30), ypos+random(20, 30), random(10, 30), random(10, 30));
    rect(xpos+random(70, 80), ypos+random(20, 30), random(10, 30), random(10, 30));
  } else {
    //Circle eyes
    ellipse(xpos+random(20, 30), ypos+random(20, 30), random(10, 30), random(5, 20));
    ellipse(xpos+random(70, 80), ypos+random(20, 30), random(10, 30), random(10, 30));
  }
  //mouth
  fill(random(0, 255), random(0, 255), random(0, 255));
  if ( happy >.5) {
    arc(xpos + 50, ypos + 65, random(50, 70), random(10, 25), PI, TWO_PI, CHORD);
  } else {
    arc(xpos + 50, ypos + 65, random(50, 70), random(10, 25), 0, PI);
  }

  if (hat == 1)
  {
    //Make a hat
    fill(random(0, 255), random(0, 255), random(0, 255));
    int hatHeight = (int) random(20, 40);
    rect(xpos +30, ypos + headHeight/8 -hatHeight, random(30, 50), hatHeight);
    rect(xpos, ypos + headHeight/8, headWidth, hatHeight/5);
  } else {
    //No hat
  }
}
