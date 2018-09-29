float bacwidth = 20;
ArrayList<Algae> alglist;
ArrayList<Sugar> suglist;
ArrayList<Yeast> yeastlist;
void setup() {
  size(500, 500);
  alglist = new ArrayList<Algae>();
  suglist = new ArrayList<Sugar>();
  yeastlist = new ArrayList<Yeast>();
  yeastlist.add(new Yeast(width/2, height/2));
  for( int i = 0; i < 250; i = i +1)
  {
    alglist.add(new Algae(random(10, width -10), random(10, height -110)));
  }
}

void draw() {
  fill(0, 0, 255);
  rect(0,0,width,height-100);
  for (int i = 0; i < alglist.size(); i = i + 1) {
    Algae b = alglist.get(i);
    b.display();
    b.Sugarchance();
  }
  // Go through the sugars and display them and move them
  for (int i = 0; i<suglist.size(); i = i + 1) {
    Sugar s = suglist.get(i);
    s.display();
    s.move();

    if (s.collides()) {
      suglist.remove(i);
      i = i - 1;
    }
  }
  // Go through the yeast list and display them
  for (int i = 0; i < yeastlist.size(); i = i +1)
  {
    //Get a yeast
    Yeast y = yeastlist.get(i);
    //Display y
    y.display();
    // if the yeast size is less than 0 it dies
    if(y.size < 0)
    {
      //RIP YEET
      yeastlist.remove(i);
      i = i -1;
    }
    
  }
  //display the number of yeast and algae
  fill(255);
  textSize(20);
  text("Algae: " + str(alglist.size()), 50, 50);
  text("Yeast: " + str(yeastlist.size()), 50, 80);
  
  fill(0);
  ellipse((frameCount/20)%width, height-yeastlist.size(), 1, 1);
  
}

void mousePressed() {
  Algae newb = new Algae(mouseX, mouseY);
  alglist.add(newb);
}
