class Bacteria {
  float x;
  float y;
  float resistance;
  Bacteria(float xin, float yin, float resin) {
    x = xin;
    y = yin;
    resistance = resin;
  }

  void move() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
  }

  void display() {
    //The greener the ellipse, the more resistant.
    fill(255-resistance, 255, 255-resistance);
    ellipse(x, y, bacsize, bacsize);
  }

  void reproduce() {
    //Random chance to reproduce
    if (random(0, 10) > 9.95) {
      //Places new bacteria next to the original bacteria
      Bacteria newbac = new Bacteria(x+random(-bacsize, bacsize), y + random(-bacsize, bacsize), resistance);
      
      //Random chance that the reproduced bacteria undergoes mutation
      //Gaining or losing resistance
      if (random(0, 25) < 1) {
        newbac.resistance = newbac.resistance + random(-75, 75);
        if (newbac.resistance < 0) {
          newbac.resistance = 0;
        }
      }
      
      //Add the new bacteria to the list
      baclist.add(newbac);
    }
  }

  boolean isdeath() {
    boolean died = false;

    //If the bacteria goes off the screen, it dies
    if (x<0 || y<0 || x>width || y>height) {
      died = true;
    }

    //Overpopulation check, if it hits other unique
    //bacteria too many times, the bacteria dies
    int hits = 0;
    for (int i = 0; i<baclist.size(); i = i + 1) {
      Bacteria otherbac = baclist.get(i);
      if (dist(x, y, otherbac.x, otherbac.y) < bacsize) {
        hits = hits + 1;
      }
    }

    if (hits>5) {
      died = true;
    }

    //If the bacteria enters an antibiotic level that it cannot resist, it dies
    if (reslevel(x)>resistance) {
      died = true;
    }

    return died;
  }
}
