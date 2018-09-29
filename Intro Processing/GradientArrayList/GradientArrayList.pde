ArrayList<Integer> hues = new ArrayList<Integer>();

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  //Draws a bar at the top out of rectangles and determines the colors through the hues arraylist
  for (int i = 0; i<hues.size(); i = i + 1) {
    fill(hues.get(i));
    rect(i*2, 0, 2, 100);
  }

  //Adds a hue value for the bar depending on the xposition of the mouse
  if (mousePressed) {
    hues.add(mouseX/4);
  }
}
