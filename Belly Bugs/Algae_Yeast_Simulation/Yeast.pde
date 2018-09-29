class Yeast{
  float x;
  float y;
  float size;
  
  Yeast(float xin, float yin){
    x = xin;
    y = yin;
    size = 20;
    
  }
  void display(){
    fill(#8B6F0A);
    ellipse(x, y, size, size);
    // if he doesn't eat he dies
    size = size -.03;
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }
  // OMNOMNOM
  void grow()
  {
    size = size +1;
    // if he gets big he splits
    if( size > 60)
    {
      size = 20;
      yeastlist.add(new Yeast(x, y));
    }
  }
  
}
