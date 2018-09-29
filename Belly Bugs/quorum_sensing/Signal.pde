class Signal {
  float x;
  float y;
  float xspeed;
  float yspeed;

  Signal(float xin, float yin, float xspeedin, float yspeedin) {
    x = xin;
    y = yin;
    xspeed = xspeedin;
    yspeed = yspeedin;
  }

  void display() {
    noStroke();
    fill(255, 255, 0);
    rect(x-1, y-1, 2, 2);
  }

  void move() {
    x = x + xspeed;
    y = y + yspeed;
  }

  boolean collides() {
    boolean collided = false;
    //If the signal hits an edge of the screen
    if (x>width || x < 0 || y > height || y < 0) {
      collided = true;
    }
    
    //If the signal hits a bacteria
    for (int i = 0; i < baclist.size(); i = i + 1) {
      Bacteria b = baclist.get(i);
      if (dist(x, y, b.x, b.y) <= bacwidth/2) {
        collided = true;
        b.absorb();
      }
    }

    return collided;
  }
}
