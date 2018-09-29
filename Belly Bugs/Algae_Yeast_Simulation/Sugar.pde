class Sugar {
  float x;
  float y;
  float xspeed;
  float yspeed;

  Sugar(float xin, float yin, float xspeedin, float yspeedin) {
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
    if (x>width || x < 0 || y > height-100 || y < 0) {
      collided = true;
    }

    for (int i = 0; i < yeastlist.size(); i = i + 1) {
      Yeast yeet = yeastlist.get(i);
      if (dist(x, y, yeet.x, yeet.y) <= yeet.size/2) {
        collided = true;
        yeet.grow();
      }
    }

    return collided;
  }
}
