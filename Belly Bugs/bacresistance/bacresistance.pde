//Inspired by this video from Harvard Medical School
//https://www.youtube.com/watch?v=plVk4NVIUh8

ArrayList<Bacteria> baclist;
float bacsize = 10;
void setup() {
  noStroke();
  size(800, 500); 
  baclist = new ArrayList<Bacteria>();
  baclist.add(new Bacteria(50, height/2, 0));
}

void draw() {
  drawbands();
  for (int i = 0; i < baclist.size(); i = i + 1) {
    Bacteria b = baclist.get(i);
    b.display();
    b.move();
    b.reproduce();
    if (b.isdeath()) {
      baclist.remove(i);
      //When you remove from an ArrayList, the indices shift.
      //In order to make sure everything loops correctly, you 
      //Need to adjust i.
      i = i - 1;
    }
  }
}

void drawbands() {
  float resistance = 0;

  //Creates 5 rectangles of increasing red
  //Higher red = higher level of antibiotics
  for (int i = 0; i <5; i = i + 1) {
    fill(resistance + 50, 0, 0);
    rect(width*i/5, 0, width/5, height);
    resistance = resistance + 50;
  }
}

//Gets the antibiotic level of the x position
float reslevel(float x) {
  int band = (int) x/(width/5);
  return band*50;
}
