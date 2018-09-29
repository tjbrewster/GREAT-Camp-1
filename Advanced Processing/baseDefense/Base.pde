//The structures involved with your team. If your main base dies, you lose.

class Base {
  float hp;
  boolean good;
  float xpos;
  float ypos;
  float size;
  boolean main; //Determines if it is a base or a mine

  Base(boolean team, boolean mainBase) {
    hp = 1000;
    good = team;
    main = mainBase;
    size = defenderWidth *10;
    if (good) {
      xpos = 0;
      ypos = height - (size);
    } else {
      xpos = width - (size);
      ypos = height - (size);
    }
  }

  void display() {
    if (good) {
      fill(255, 0, 0);
      rect(xpos, ypos, size, size);
      
    } else {
      fill(255, 255, 0);
      rect(xpos, ypos, size, size);
     
    }
    fill(0);
    textSize(40);
    text(str(int(hp)), xpos, ypos + (size)/2);
    
  }

  //Checks to see if any defenders collide with the base
  boolean collide() {
    boolean collided = false;
    //Iterate through defenders
    for (int i = 0; i < defenders.size(); i++) {
      Defender current = defenders.get(i);
      //If the selected defender in the list comes in contact with the base
      if (current.xpos<xpos+size && xpos < current.xpos + defenderWidth
      && current.ypos < ypos+size && ypos<current.ypos+defenderWidth) {
        current.xvel = -current.xvel;
        current.yvel = -current.yvel;
        //If the defender is on the other team, do damage to the base
        if (good != current.good) {
          hp -= current.attack;
          money(current);
          collided = true;
        }
      }
    }
    return collided;
  }
}
