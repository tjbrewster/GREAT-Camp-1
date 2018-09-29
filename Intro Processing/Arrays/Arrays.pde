//Stores the size of the ellipses
int[] sizes = new int[10];

void setup() {
  size(600, 600);

  //Adding a bunch of values to an array
  for (int i = 0; i<10; i = i + 1) {
    sizes[i] = 100;
  }

}

//When the mouse is pressed, Reduce the size of a random circle
void mousePressed() {
  int randbox = (int) random(0, 10);
  sizes[randbox] = sizes[randbox]-10;
}

void draw() {
  background(255, 255, 255);
  //Display the ellipses in a row
  for (int i = 0; i<10; i = i + 1) {
    ellipse(i*50+50, 100, sizes[i], 50);
  }
}
