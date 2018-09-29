//A defender that can also heal allies it collides into

class Cleric extends Defender{
  
  Cleric(boolean team)
  {
    super(team);
  }
  @Override
  void display()
  {
    super.display();
    fill(255);
    rect(xpos +defenderWidth/2, ypos-5,5,20);
    rect(xpos+5, ypos, 15, 5);
    
  }
  @Override
  boolean collide(int index) {
    boolean collided = false;
    for (int i = index + 1; i < defenders.size(); i++) {
      Defender other = defenders.get(i);
      if (abs(xpos - other.xpos) < defenderWidth && abs(ypos - other.ypos) < defenderWidth) {
        //Fight if the other defender is an enemy
       if(other.good != good)
       {
        float otherxvel = other.xvel;
        float otheryvel = other.yvel;
        other.xvel = xvel;
        other.yvel = yvel;
        xvel = otherxvel;
        yvel = otheryvel;
        other.fight(this);
        this.fight(other);
        collided = true;
        //Heal if the other defender is an ally
       }else{
         other.heal();
       }
      }
    }
    return collided;
  }
}
