class Bacteria {
  float x;
  float y;
  float absorbcount;

  Bacteria(float xin, float yin) {
    x = xin;
    y = yin;
    absorbcount = 0;
  }

  void display() {
    fill(255); 
    if (absorbcount > 10) {
      //bioluminescence
      fill(0, 255, 255);
    } else {
      //Make sure absorbcount resets every two seconds
      if (frameCount % 120 == 0) {
        absorbcount = 0;
      }
    }
    ellipse(x, y, bacwidth, bacwidth);
  }

  void signalchance() {
    float chance = 0.975;
    //When a bacteria is bioluminescent, emit more signals
    if (absorbcount>10) {
      chance = .7;
    }
    //rng to determine whether or not the bacteria will emit a signal
    if (random(0, 1)>chance) {
      Signal news;
      //Determine from which side of the bacteria the signal will come from
      switch((int) random(1, 5)) {
      case 1: //Right
        news = new Signal(x+bacwidth/2 + 2, y, random(0, 2), random(-2, 2));
        siglist.add(news);
        break;

      case 2: //Left
        news = new Signal(x-bacwidth/2 - 2, y, random(-2, 0), random(-2, 2));
        siglist.add(news);
        break;

      case 3: //Up
        news = new Signal(x, y - bacwidth/2 - 2, random(-2, 2), random(-2, 0));
        siglist.add(news);
        break;

      case 4: //Down
        news = new Signal(x, y + bacwidth/2 + 2, random(-2, 2), random(0, 2));
        siglist.add(news);
        break;
      }
    }
  }

  void absorb() {
    absorbcount = absorbcount + 1;
  }
}
