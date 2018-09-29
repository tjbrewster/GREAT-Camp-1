ArrayList<Integer> xlist = new ArrayList<Integer>(); //ellipse x position
ArrayList<Integer> ylist = new ArrayList<Integer>(); //ellipse y position
ArrayList<Integer> colorList = new ArrayList<Integer>(); //ellipse color

void setup()
{
  size(800, 400);
  print(xlist.size());
  noStroke();
}

void draw()
{
  background(0);

  //Go through each ellipse in the xposition arraylist
  for (int i = 0; i <xlist.size(); i = i +1)
  {
    //change the color to the value in the colorlist
    fill(colorList.get(i));
    stroke(colorList.get(i), 0, (colorList.get(i)*colorList.get(i))%255);

    //draw an ellipse with xlist and ylist
    ellipse(xlist.get(i), ylist.get(i), 50, 50);

    //If the ellipse's x value is still on screen
    if (xlist.get(i) < width)
    {
      //Move the ellipse slightly to the right, creating a scrolling effect
      xlist.set(i, xlist.get(i) +5);
    } else //If the circle is past the right side of the screen
    {
      //Move the ellipse to past the left side of the screen, creating a scrolling effect
      xlist.set(i, xlist.get(i) - width );
    }
  }

  //If mouse is pressed, make a new ellipse at mouseX, mouseY, and new color at mouseX%255
  if (mousePressed)
  {
    xlist.add(mouseX);
    ylist.add(mouseY);
    colorList.add(mouseX%255);
  }

  //If a key is pressed, remove the first circle from teh list
  if (keyPressed)
  {
    if ( xlist.size() > 0) //If this if statement is not here, we will get an IndexOutOfBounds Exception
    {
      xlist.remove(0);
      ylist.remove(0);
      colorList.remove(0);
    }
  }
}
