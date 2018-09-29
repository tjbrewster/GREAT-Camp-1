int x = 50;
ArrayList<Float> sizes = new ArrayList<Float>();

void setup() {
  size(820, 800); 

  sizes.add(50.0);
}

void draw() {
  background(0, 0, 0);
  if (keyPressed) {
    if (key == ' ') {
      sizes.add(random(1, 50));
    }
  }
  x = 0;
  for (int c = 0; c < sizes.size(); c++) {
    ellipse(x, sizes.get(c)*20, sizes.get(c), sizes.get(c));
    x = x + (int) random(40, 60);
    if (x>width) {
      x = x - width; 
      fill(random(0, 255), random(0, 255), random(0, 255));
    }

    if (x - mouseX < 50 && sizes.get(c)*20-mouseY < 50) {
      if (x-mouseX>0 && sizes.get(c)*20-mouseY>0) {
        sizes.remove(c);
      }
    }
  }
  rect(mouseX, mouseY, 50, 50);

  for (int i = 0; i < sizes.size(); i++) {
    sizes.set(i, sizes.get(i)+1+sizes.get(i)/20.0);
    if (sizes.get(i)*20>height) {
      sizes.set(i, 0.0);
    }
  }
}
