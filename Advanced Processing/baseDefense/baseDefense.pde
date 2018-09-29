//Objective is to teach how to make more complicated games with multiple classes and inheritance

//Be sure to download and import the sound library
//Sketch > Import Library > Add Library... > Search "sound" > Sound | Sound Library for Processing
import processing.sound.*;

float defenderWidth;
ArrayList<Defender> defenders;
ArrayList<Base> bases;
float p2Money; //Player 2 Money
float p1Money; //Player 1 Money
SoundFile drum;
String message; //Victory Message
int winPos;
int redMine = 0; //Amount of Red Mines on the field
int yellowMine = 0; //Amount of Yellow Mines on the field

void settings() {
  fullScreen();
}

void setup() {
  //Music for the game
  drum = new SoundFile(this, "Drummer.wav");
  drum.play();
  
  message = "";
  p1Money = 100;
  p2Money = 100;
  defenderWidth = 20;
  defenders = new ArrayList<Defender>();
  bases = new ArrayList<Base>();
  size(500, 500);
  bases.add(new Base(true, true));
  bases.add(new Base(false, true));
  //defenders.add(new Defender(false));
}

void draw()
{
  background(0);
  // every second add a good and a bad defender
  //if (frameCount % 60 == 0)
  //{
  //  float rand = random(1);
  //  if(rand <.25){
  //  Defender good = new Defender(true);
  //  Defender bad = new Defender(false);
  //  defenders.add(good);
  //  defenders.add(bad);
  //  }
  //  if(rand >.25 && rand <.5){
  //  Knight good = new Knight(true);
  //  Knight bad = new Knight(false);
  //  defenders.add(good);
  //  defenders.add(bad);
  //  }
  //  if(rand >.5&& rand <.75){
  //    Wizard good = new Wizard(true);
  //    Wizard bad = new Wizard(false);
  //    defenders.add(good);
  //  defenders.add(bad);
  //  }
  //  if(rand >.75)
  //  {
  //    Ice good = new Ice(true);
  //    Ice bad = new Ice(false);
  //    defenders.add(good);
  //  defenders.add(bad);
  //  }

  //}
  // play music and add money
  if (frameCount %420 == 0)
  {
    drum.stop();
    drum.play();
    p1Money +=10;
    p2Money +=10;
  }
  //iterate through the defenders and move them
  for ( int i = 0; i < defenders.size(); i++)
  {
    Defender current = defenders.get(i);
    current.display();
    current.move();
    current.collide(i);
    if (current.hp <= 0) {
      defenders.remove(i);
      i = i - 1;
      fill(#E36009);
      ellipse(current.xpos, current.ypos, 4, 4);
    }
  }
  //Iterate through the bases
  for (int i = 0; i < bases.size(); i++) {
    Base current = bases.get(i);
    current.display();
    current.collide();
    if (current.hp <=0&& current.good) {
      if(current.main)message = "YELLOW WINS";
      winPos = width/12;
      bases.remove(i);
      i--;
    } else if (current.hp <=0&& !current.good)
    {
      if(current.main)message = "RED WINS";
      winPos = width/8;
      bases.remove(i);
      i--;
    }
  }
  // display money
  fill(255);
  textSize(20);
  text("Player 1 Money: " + int(p1Money), 50, 50);
  text("Player 2 Money: " + int(p2Money), width-300, 50);
  // display title
  textSize(40);
  text("BASE DEFENDER", width/2-150, 50);
  //display win message
  textSize(200);
  text(message, winPos, height/2);
}
// gives money to the team of the defender when it kills an enemy
void money(Defender d) {
  if (d.good)
  {
    p1Money += 10;
  } else {
    p2Money += 10;
  }
}

//Different keys let you spend money on different defenders
void keyPressed()
{
  //Red Defender
  if (key == 'a' && p1Money >= 10)
  {
    defenders.add(new Defender(true));
    p1Money = p1Money -10;
  }
  //Yellow Defender
  if (key == 'j' && p2Money >= 10)
  {
    defenders.add(new Defender(false));
    p2Money = p2Money -10;
  }

  //Red Knight
  if (key == 's' && p1Money >= 20)
  {
    defenders.add(new Knight(true));
    p1Money = p1Money -20;
  }
  
  //Yellow Knight
  if (key == 'k' && p2Money >= 20)
  {
    defenders.add(new Knight(false));
    p2Money = p2Money -20;
  }
  
  //Red Ice
  if (key == 'd' && p1Money >= 30)
  {
    defenders.add(new Ice(true));
    p1Money = p1Money -30;
  }
  
  //Yellow Ice
  if (key == 'l' && p2Money >= 30)
  {
    defenders.add(new Ice(false));
    p2Money = p2Money -30;
  }
  
  //Red Wizard
  if (key == 'w' && p1Money >= 40)
  {
    defenders.add(new Wizard(true));
    p1Money = p1Money -40;
  }
  
  //Yellow Wizard
  if (key == 'i' && p2Money >= 40)
  {
    defenders.add(new Wizard(false));
    p2Money = p2Money -40;
  }
  
  //Red Cleric
  if (key == 'x' && p1Money >= 40)
  {
    defenders.add(new Cleric(true));
    p1Money = p1Money -40;
  }
  
  //Yellow Cleric
  if (key == 'm' && p2Money >= 40)
  {
    defenders.add(new Cleric(false));
    p2Money = p2Money -40;
  }
  
  //Red Mine
  if (key == 'z' && p1Money >= 100)
  {
    bases.add(new Mine(true, redMine));
    p1Money = p1Money -100;
    redMine++;
  }
  
  //Yellow Mine
  if (key == 'n' && p2Money >= 100)
  {
    bases.add(new Mine(false, yellowMine));
    yellowMine++;
    p2Money = p2Money -100;
  }
}
