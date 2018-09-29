float bacwidth = 50;
ArrayList<Bacteria> baclist;
ArrayList<Signal> siglist;

void setup() {
  size(500, 500);
  baclist = new ArrayList<Bacteria>();
  siglist = new ArrayList<Signal>();
}

void draw() {
  background(0);

  //display bacteria and emit signals through the list
  for (int i = 0; i < baclist.size(); i = i + 1) {
    Bacteria b = baclist.get(i);
    b.display();
    b.signalchance();
  }

  //display and move the signals through the list
  for (int i = 0; i<siglist.size(); i = i + 1) {
    Signal s = siglist.get(i);
    s.display();
    s.move();

    //if a signal hits a bacteria or the edge of the screen
    if (s.collides()) {
      siglist.remove(i);

      //change i so the shifting indices don't
      //affect the loop working incorrectly
      i = i - 1;
    }
  }
}

void mousePressed() {
  Bacteria newb = new Bacteria(mouseX, mouseY);
  baclist.add(newb);
}
