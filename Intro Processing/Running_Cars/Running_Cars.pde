//Teaches the basics of Classes and Objects

//Car is the Class, c is the Object
Car c;
ArrayList<Car> road = new ArrayList<Car>();

void setup()
{
  fullScreen(); 
  background(0, 150, 150);
  c = new Car();
  
  c.xpos = 100;
  
}

void draw()
{
  background(0, 150, 150);
  //Getting a single car to display and move
  c.display();
  c.drive();
  
  //Getting a group of cars to display and move
  //Display and drive each car in the arraylist
  for(int i = 0; i < road.size(); i = i + 1){
     road.get(i).display();
     road.get(i).drive();
  } 
}

//When key is pressed, add a new car to the arraylist to be displayed on the road
void keyPressed(){
   road.add(new Car()); 
}
