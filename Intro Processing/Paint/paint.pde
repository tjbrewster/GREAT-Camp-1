//This paint program was used for the avoid maze game
//If students lost access to their original paint program
//It only paints in red and saves

void settings() {
  fullScreen();
}

void setup() {
  stroke(255, 0, 0);
  strokeWeight(height/20);
}

void draw() {
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == 's') {
    //Save the image
    PImage screenshot = get();
    screenshot.save("maze.png");
  }
}
