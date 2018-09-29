class Algae{
   float x;
   float y;
   
   Algae(float xin, float yin){
       x = xin;
       y = yin;
   }
   
   void display(){
     fill(10, 100, 10); 
     ellipse(x,y,bacwidth,bacwidth); 
   }
   
   void Sugarchance(){
     //The Algae has a chance of secreting a sugar
     float chance = 0.985;
      if(random(0, 1)>chance){
        Sugar news = new Sugar(x+bacwidth/2 + 2, y, random(-5, 5), random(-5, 5));
         suglist.add(news);       
      }
   }
}
