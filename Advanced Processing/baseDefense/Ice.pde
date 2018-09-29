//A defender that also reduces the velocity of its enemies

class Ice extends Defender{
  
  Ice(boolean team){
    super(team);
  }
  @Override
  void display()
  {
    super.display();
    fill(#09E3DD);
    rect(xpos+2,ypos+2,defenderWidth-5,defenderWidth-5);
  }
  
  //Slows down the other defender
  @Override
  void fight(Defender other)
  {
    super.fight(other);
    other.xvel = other.xvel/2;
    other.yvel = other.yvel/2;
    
  }
}
