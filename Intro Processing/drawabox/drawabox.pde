//Teaches how to make functions

void setup() {
  size(500, 600);
  drawabox(100, 50);
  drawabox(200, 400);
  drawabox(300, 200);
 }

void draw() {
}

void drawabox(int xpos, int ypos) {
  fill(255,random(0,255),0);
  rect(xpos, ypos, width/2, height/4);  
  ellipse(xpos, ypos + height/8, width/6, width/6);
}
