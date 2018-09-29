//The mine generates money over time for its team

class Mine extends Base {

  Mine(boolean team, int number) {
    super(team,false);
    size = size/5;
    hp = 100;
    if (good) {
      xpos=0;
      ypos = 0 + (size+10)*number;
    } else {
      xpos= width-size;
      ypos=0 + (size+10)*number;
    }
  }
  //Generates money over time for its team
  @Override
    void display()
  {
    if (good) {
      fill(255, 0, 0);
      rect(xpos, ypos, size, size);
      p1Money +=.05;
    } else {
      fill(255, 255, 0);
      rect(xpos, ypos, size, size);
      p2Money+=.05;
    }
    fill(100);
    triangle(xpos, ypos+size, xpos+size/2, ypos, xpos+size, ypos+size);
    fill(255);
    textSize(20);
    text(str(int(hp)), xpos, ypos + (size)/2);
  }
  
  @Override
    boolean collide()
  {
    for (int i = 0; i < defenders.size(); i++) {
      Defender current = defenders.get(i);
      //If the mine and defender collide, bounce
      if (current.xpos<xpos+size && xpos < current.xpos + defenderWidth
        && current.ypos < ypos+size && ypos<current.ypos+defenderWidth && current.good != good) {
        current.xvel = -current.xvel;
        current.yvel = -current.yvel;
        //If the defender is an enemy, deal damage to the mine
        if (good != current.good) {
          hp -= current.attack;
          money(current);
          
        }
      }
    }
    if (good && hp <=0)
    {
      redMine--;
    }
    if (!good && hp <=0)
    {
      yellowMine--;
    }
    return false;
  }
}
