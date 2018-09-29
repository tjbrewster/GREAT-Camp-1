//A stronger version of the Defender

class Knight extends Defender{
  
  
  Knight(boolean team){
    super(team);
  }
  
  @Override
  void display()
  {
    super.display();
    fill(100);
    ellipse(xpos+defenderWidth/2,ypos,10,10);
  }
  
  @Override
  void fight(Defender other)
  {
    hp = hp - other.attack/2;
    if(hp <0){
      money(other);
    }
  }
}
