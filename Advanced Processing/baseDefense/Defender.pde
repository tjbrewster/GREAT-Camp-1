//A basic fighting unit that can fight

class Defender {
  float xpos;
  float ypos;
  float yvel;
  float xvel;
  float hp;
  float attack;
  boolean good;
  boolean heal;
  int healCount;

  Defender(boolean team) {
    good = team;
    heal = false;
    healCount = 0;
    if (good)
    {
      xpos = 0;
      ypos = random(0, height/2);
      xvel = random(1, 3);
      yvel = random(-2, 2);
    } else {
      xpos = width - defenderWidth;
      ypos = random(0, height/2);
      xvel = random(-3, -1);
      yvel = random(-2, 2);
    }
    attack = random(15, 25);
    hp = 100;
  }

  void display()
  {
    fill(255 - (100 - hp), 255 - (100 - hp), 0);
    // if the rectangle is good fill with red, else it is yellow
    if (good) fill(255 - (100 - hp), 0, 0);
    rect(xpos, ypos, defenderWidth, defenderWidth);
    if(heal){
      healCount++;
    }
    if(healCount == 20)
    {
      heal = false;
      healCount = 0;
    }
  }
  // move the defender and bounce off of walls
  void move() {
    xpos += xvel;
    ypos += yvel;
    // bounce off of right
    if ( xpos > width - defenderWidth)
    {
      xpos = width - defenderWidth;
      xvel = -xvel;
    }
    // bounce off of left
    if ( xpos < 0)
    {
      xpos = 0;
      xvel = -xvel;
    }
    // bounce off of bottom
    if (ypos > height - defenderWidth)
    {
      ypos = height - defenderWidth;
      yvel = -yvel;
    }
    // bounce off of top
    if (ypos < 0)
    {
      ypos = 0;
      yvel = -yvel;
    }
  }

  boolean collide(int index) {
    boolean collided = false;
    for (int i = index + 1; i < defenders.size(); i++) {
      Defender other = defenders.get(i);
      if (abs(xpos - other.xpos) < defenderWidth && abs(ypos - other.ypos) < defenderWidth && other.good != good) {
        float otherxvel = other.xvel;
        float otheryvel = other.yvel;
        other.xvel = xvel;
        other.yvel = yvel;
        xvel = otherxvel;
        yvel = otheryvel;
        other.fight(this);
        this.fight(other);
        collided = true;
      }
    }
    return collided;
  }
  
  void heal(){
   
    if(!heal){
        hp = hp +5;
    }
    heal = true;
  
  }
  void fight(Defender other){
    
    hp = hp - other.attack;
    if(hp <0){
      money(other);
    }
  }
}
