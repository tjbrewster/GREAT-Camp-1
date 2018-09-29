//A defender that can convert enemies into allies

class Wizard extends Defender{
  
  Wizard(boolean team)
  {
    super(team);
  }
  
  @Override
  void display()
  {
    super.display();
    fill(200,50,200);
    triangle(xpos,ypos,xpos+defenderWidth/2, ypos-5,xpos+defenderWidth,ypos);
  }
  
  //Converts the enemy defender into the wizard's own team
  @Override
  void fight(Defender other){
    super.fight(other);
    other.good = good;
  }
  
}
