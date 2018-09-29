ArrayList<Splitball> splitlist = new ArrayList<Splitball>();
void setup()
{
  size(500, 400);
}

void draw()
{
  background(0);

  //Go through each Splitball in the arraylist
  for (int i = 0; i < splitlist.size(); i = i +1)
  {
    Splitball b = splitlist.get(i);
    b.display();
    //When the Splitball gets too big, split it up into two smaller splitballs
    if ( b.size >300)
    {
      //create the two small Splitballs
      splitlist.add(new Splitball(b.xpos+ 50, b.ypos, b.size/8));
      splitlist.add(new Splitball(b.xpos- 50, b.ypos, b.size/8));
      //remove the big Splitball
      splitlist.remove(i);
    }
  }
}

void mouseClicked()
{
  splitlist.add(new Splitball(mouseX, mouseY, 100));
}
