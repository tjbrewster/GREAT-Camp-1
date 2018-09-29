Square square;
ArrayList squares;
 
 
void setup() {
  size(300, 400);
  colorMode(HSB);
  noStroke();
  rectMode(CENTER);
  squares = new ArrayList();
  frameRate(60);
}
 
void draw() {
  background(0);
  for (int i = 0; i < squares.size(); i++) {
      Square square = (Square) squares.get(i);
      square.display();
      square.move();
      }
}
 
void mousePressed() {
  squares.add(new Square(mouseX, mouseY, random(255), random(0.5, 2)));
  Square square = (Square) squares.get(squares.size()-1);
  square.init();
}
 