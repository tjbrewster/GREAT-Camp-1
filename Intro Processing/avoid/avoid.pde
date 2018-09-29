//The image of the current maze picture that is loaded
Level levelone;
//If the mouse collides with this color, you lose;
color bad = color(255, 0, 0);
int playerwidth;
//Keeps track of if the menu is up or not
boolean isMenu = true;
//Message to display in menu
String message = "Put the cursor in the bottom left corner to begin.";

void settings() {
  fullScreen();
}

void setup() {

  background(255);
  levelone = new Level("maze.png");
  //set width of hitbox for mouse
  playerwidth = width/20;
}

void draw() {
  if (isMenu) {
    menu();
  } else {
    levelone.drawlevel();
  }
}

void menu() {
  background(255);
  fill(0);
  textSize(height/20);
  text("Avoid", width/2-height/10, height/20);
  textSize(height/40);
  text(message, width/2-height/4, height/2);
  fill(255);
  rect(0, height-playerwidth, playerwidth, playerwidth);
  fill(0);
  textSize(playerwidth/3);
  text("Start", 0, height-playerwidth/3);

  if (mouseX<playerwidth && mouseY>height-playerwidth) {
    isMenu = false;
    levelone.reset();
  }
}

void mouseMoved() {
  if (!isMenu) {
    levelone.collide();
  }
}