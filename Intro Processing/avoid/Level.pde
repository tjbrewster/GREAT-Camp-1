class Level {
  PImage img;
  int highscore;
  int starttime;

  Level(String filename) {
    //load the maze picture made in their maze program
    img = loadImage(filename);
    //resize it to the screen size if needed
    img.resize(width, height);
    
    starttime = millis();
  }

  void collide() {
    //check if the player is touching red this frame
    for (int x = 0; x < playerwidth; x++) {
      for (int y = 0; y < playerwidth; y++) {
        if (img.get(x+mouseX, y+mouseY) ==  bad) {
          // the player loses
          isMenu = true;
          message = "You lose.";
        }
      }
    }

    //check if the player wins
    if (mouseX > width-playerwidth && mouseY<playerwidth) {
      isMenu = true;
      message = "You win!";
    }
  }

  void drawlevel() {
    // draw the level behind everything
    image(img, 0, 0);
    //draw the goal
    fill(0, 200, 0);
    rect(width-playerwidth, 0, playerwidth, playerwidth);
    fill(0);
    textSize(playerwidth/3);
    text("End", width-playerwidth, playerwidth-playerwidth/3);

    fill(255);
    strokeWeight(1);
    stroke(0, 0, 0);
    rect(mouseX, mouseY, playerwidth, playerwidth);
  }
  
  void reset(){
    starttime = millis();
  }
}