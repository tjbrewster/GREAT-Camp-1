//Showing the use of rotate and translate to make cool animations, but are not recommended to use

float rspeed;
float rw;
float rh;
ArrayList<Integer> colors = new ArrayList<Integer>();

void setup() {
  noFill();
  stroke(0, 150, 0);
  size(500, 500);
  rspeed = 0;
  strokeWeight(10);
  rw = random(height/2, height);
  rh = random(height/2, height);
  for(int i = 0; i <40; i++)
  {
    colors.add(color(random(0,255), random(0,255),random(0,255),100));
  }
}

void draw() {
  background(0);
  translate((-width/2)+(rspeed*800%(width*2)), height/2);
  //translate(, mouseY);
  rectMode(CENTER);
  rotate(rspeed);
  int i = 0;
  while (i<40) {
    stroke(colors.get(i));
    //ellipse(mouseX/2, mouseY/2, rw-i*6, rh-i*6);
    rect(mouseX, mouseY, rw-i*6, rh-i*6);
    
    rotate(rspeed);
    i = i + 1;
  }
  rspeed = rspeed + PI/10000;
  
}
