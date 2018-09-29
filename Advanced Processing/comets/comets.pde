ArrayList<Comet> comets;
ArrayList<PImage> faces;
void setup() {
  size(500, 500);
  comets = new ArrayList<Comet>();
  faces = new ArrayList<PImage>();
  faces.add(loadImage("class1.png"));
  faces.add(loadImage("class2.png"));
  faces.add(loadImage("class3.png"));
}

void draw() {
  if(keyPressed)
  {
  background(0);
  for (int i = 0; i < comets.size(); i += 1) {
    Comet current = comets.get(i);
    current.display();
    current.move();
  }
  }
  else
  {
    
  }
}

void mousePressed() {
  Comet newcomet = new Comet(mouseX, mouseY);
  comets.add(newcomet);
}
