class Comet {
  float xpos;
  float ypos;
  float startx;
  float starty;
  float velx;
  float vely;
  color fill;
  float pineapple;
  Comet(float startxin, float startyin) {
    startx = startxin;
    starty = startyin;
    xpos = startx;
    ypos = starty;
    velx = random(-1, 1);
    vely = random(-1, 1);
    fill = color(random(0,255),random(0,255),random(0,255));
    pineapple = random(0,1);
  }

  void display() {
    if(pineapple <.25)
    {
    fill(fill);
    ellipse(xpos, ypos, 10, 10);
    fill(255,255,0);
    fill(fill,100);
    triangle(xpos-velx*10, ypos-vely*10, xpos+random(-10, 10), 
      ypos+random(-10, 10), startx, starty);//xpos+random(-10, 10), ypos+random(-10, 10));
    }
    else if( pineapple >.25 && pineapple <.5)
    {
       image(faces.get(0),xpos,ypos);
       faces.get(0).resize(20,20);
    }
    else if( pineapple >.5 && pineapple <.75)
    {
       image(faces.get(1),xpos,ypos);
       faces.get(1).resize(20,20);
    }
    else if( pineapple >.75 && pineapple <.95)
    {
       image(faces.get(2),xpos,ypos);
       faces.get(2).resize(20,20);
    }
    else{
     drawAPineapple(xpos,ypos); 
    }
  }

  void move() {
    xpos = xpos + velx;
    ypos = ypos + vely;
    if (xpos>width || xpos<0 || ypos<0 || ypos>height) {
      xpos = width/2 - (xpos - width/2);
      ypos = height/2 - (ypos - height/2);
    }
    
    if(abs(xpos-mouseX) > 1){
    velx -= 1/(xpos-mouseX);
    }
    if(abs(ypos-mouseY) > 1){
    vely -= 1/(ypos-mouseY);
    }
  }
  void drawAPineapple(float x ,float y)
{
  fill(20, 124, 11);
  triangle(x-20, y-15, x- width/6, y-height/5, x, y-15);
  triangle(x-10, y-15, x- width/6+20, y-height/5, x+10, y-15);
  triangle(x, y-15, x- width/6+50, y-height/5, x+20, y-15);
  triangle(x, y-15, x- width/6+80, y-height/5, x+20, y-15);
  triangle(x, y-15, x- width/6+120, y-height/5, x+20, y-15);
  triangle(x, y-15, x- width/6+160, y-height/5, x+20, y-15);
  fill(255, 255, 0);
  rect(x-25, y-25, 50, 75, 100);
  fill(255, 255, 255);
  ellipse(x-10, y, 15, 15);
  ellipse(x+10,y,15,15);
 fill(0);
  ellipse(x-10,y,5,5);
  ellipse(x+10,y,5,5);
  fill(255,0,0);
  rect(x-10,y+20,20,10);
  fill(235,255,0);
  ellipse(x,y+10,3,3);
}
}
