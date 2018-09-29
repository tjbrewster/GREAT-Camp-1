class Car {
  //Data members - attributes that each class has to keep track of
  int xpos;
  int ypos;
  int brightness;
  int speed;

  //Constructor - a blueprint to make a new car object
  Car() {
    xpos = 0;
    ypos = (int) random(-height/2, height/2);
    brightness = (int) random(20, 255);
    speed = (int) random(1, 5);
  }
  
  //Functions - functions that can be done by any object of this class
  
  //drives the car by increasing xpos
  void drive(){
     xpos = xpos + speed;
     
     //if it approaches the right side of the screen, move it to the
     //left side of the screen
     if(xpos>width+100){
        xpos = 0 - 200; 
     }
  }

  //drawing the car
  void display()
  {
    stroke(0, 150, 150);
    fill(0);
    ellipse(15+xpos, height/2+50+ypos, 20, 20);
    ellipse(60+xpos, height/2+50+ypos, 20, 20);
    ellipse(105+xpos, height/2+50+ypos, 20, 20);
    fill(brightness);
    ellipse(15+xpos, height/2+50+ypos, 10, 10);
    ellipse(60+xpos, height/2+50+ypos, 10, 10);
    ellipse(105+xpos, height/2+50+ypos, 10, 10);
    noStroke();
    fill(brightness, 20, 0);
    rect(xpos, height/2+ypos, 100, 50);
    fill(100, 100, 100);
    rect(100+xpos, height/2+25+ypos, 25, 25);
    fill(90, 90, 90);
    quad(xpos, height/2+ypos, 100+xpos, height/2+ypos, xpos+40, height/2+ypos-20, xpos-40, height/2+ypos-20);
    fill(95, 95, 95);
    quad(xpos, height/2+ypos, xpos-40, height/2+ypos-20, xpos-40, height/2+ypos+30, xpos, height/2+ypos+50);
    fill(0);
    stroke(0, 150, 150);
    ellipse(20+xpos, height/2+50+ypos, 20, 20);
    ellipse(65+xpos, height/2+50+ypos, 20, 20);
    ellipse(110+xpos, height/2+50+ypos, 20, 20);
    fill(100, 100, 100);
    ellipse(20+xpos, height/2+50+ypos, 8, 8);
    ellipse(65+xpos, height/2+50+ypos, 8, 8);
    ellipse(110+xpos, height/2+50+ypos, 8, 8);
    fill(0, 130, 130);
    triangle(100+xpos, height/2+ypos+25, 125+xpos, height/2+ypos+25, 100+xpos, height/2+ypos);
  }
}
