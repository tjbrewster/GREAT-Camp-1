boolean circle = false;
boolean rectangle = false;
boolean line = false;
boolean triangle = false;
void setup()
{
  background(255);
  size(1000 , 500);
  // set up the different shape options
    rect(0,450, 1000, 100);
  // rectangle!
  rect(20,460, 30, 30);
  //circle!
  ellipse(80, 475, 30, 30);
  //triangle!
  triangle(110, 490, 130, 490, 120, 460);
  
  // set up different color options
  //blue
   fill(0,0,255);
   rect(150,460, 30, 30);
   //green
   fill(0, 255, 0);
   rect(200,460, 30, 30);
   //yellow
   fill(#FFED4B);
   rect(250,460, 30, 30);
   //red
   fill(255,0,0);
   rect(300,460, 30, 30);
   // set default fill to white
   fill(255);
  
 
  
  
  
}

void draw()
{
  if (keyPressed)
  {
    if(key == 'x')
    {
      stroke(0);
    setup();
    }
  }
   if(key == 'b')
  {
   fill(0,0,255);
   stroke(0,0,255);
  }
  if(key == 'g')
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
  }
  if(key == 'y')
  {
    fill(#FFED4B);
    stroke(#FFED4B);
  }
  
  if(key == 'r')
  {
    rectangle = true;
    line = false;
    circle = false;
    triangle = false;
  }
  else if (key == 'c')
  {
    rectangle = false;
    line = false;
    triangle = false;
    circle = true;
  }
  
  else if (key == 'l')
  {
    rectangle = false;
    line = true;
    circle = false;
    triangle = false;
  }
  else if (key == 't')
  {
     rectangle = false;
    line = false;
    circle = false;
    triangle = true;
    
  }
  // choose shapes/colors
  if (mouseY > 450 && mousePressed)
  {
   // change the shape to square
  if( mouseX < 50)
  {
    rectangle = true;
    line = false;
    circle = false;
    triangle = false;
  }
  // change the shape to circle
  else if( mouseX > 50 && mouseX < 100)
  {
    rectangle = false;
    line = false;
    circle = true;
    triangle = false;
  }
    // change the shape to triangle
  else if( mouseX > 100 && mouseX < 150)
  {
    rectangle = false;
    line = false;
    circle = false;
    triangle = true;
  }
   // change the color to blue
  else if( mouseX > 150 && mouseX < 200)
  {
     fill(0,0,255);
   stroke(0,0,255);
  }
  // change the color to green
  else if( mouseX > 200 && mouseX < 250)
  {
     fill(0, 255, 0);
     stroke(0, 255, 0);
  }
  // change the color to yellow
   else if( mouseX > 250 && mouseX < 300)
  {
     fill(#FFED4B);
    stroke(#FFED4B);
  }
  // change the color to red
  else if( mouseX > 300 && mouseX < 330)
  {
     fill(255,0,0);
     stroke(255,0,0);
  }
    
  }
  //Draw When the Mouse is pressed :D
  else if(mousePressed)
  {
    if(circle)
    {
    ellipse(mouseX,mouseY,100,100);
    }
    else if(rectangle)
    {
      rect(mouseX - 50, mouseY, 100, 100);
    }
    else if (triangle)
    {
      triangle(mouseX, mouseY , mouseX -50, mouseY +50 , mouseX +50, mouseY + 50);
    }
    else
    {
      
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
}
