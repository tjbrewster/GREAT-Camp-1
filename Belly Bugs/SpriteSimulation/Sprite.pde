class Sprite extends SimpleSprite {
  int health = (int) random(100, 200);
  //int totalSprites= (team1.size() + team2.size() + team3.size() + team4.size());
  // int percent = totalSprites;
  int team;
  int columns;
  int rows;
  String name;
  int hf = 1;//(int) random(10);
  int split = 400;
  int x;
  int y;
  Sprite(int xx, int yy, String fileName, int c, int r, int t) {
    super(xx, yy, fileName, c, r);
    columns = c;
    name  = fileName;
    rows = r;
    team = t;
    x= xx;
    y = yy;
    if (team ==4) {
      println(x + "  " + y);
    }
    
  }

  void update() {

    if (random(0,1) < .5){
      health+=10;
    } else { 
     health--;
    }


    switch(team) {

    case 1:
      for (int i = 0; i < team2.size(); i ++) {
        if (collision(team2.get(i)) ) {
          health = health - hf;
        }
      }
      for (int i = 0; i < team3.size(); i ++) {
        if (collision(team3.get(i)) ) {
          health = health - (hf);
        }
      }
      for (int i = 0; i < team4.size(); i ++) {
        if (collision(team4.get(i)) ) {
          health = health - hf;
        }
      }
      if (health > split) {
        team1.add(new Sprite(x, y, name, columns, rows, team));
      }
      if (health <= 0) {
        team1.remove(this);
      }
      break;
    case 2:
      for (int i = 0; i < team1.size(); i ++) {
        if (collision(team1.get(i)) ) {
          health = health - hf -50 + 2;
        }
      }
      for (int i = 0; i < team3.size(); i ++) {
        if (collision(team3.get(i)) ) {
          health = health - hf + 2;
        }
      }
      for (int i = 0; i < team4.size(); i ++) {
        if (collision(team4.get(i)) ) {
          health = health - hf +2;
        }
      }
      if (health > split) {
        team2.add(new Sprite(x, y, name, columns, rows, team));
      }
      if (health <= 0) {
        team2.remove(this);
      }
      break;
    case 3:
      for (int i = 0; i < team1.size(); i ++) {
        if (collision(team1.get(i)) ) {
          health = health -hf -50;
        }
      }
      for (int i = 0; i < team2.size(); i ++) {
        if (collision(team2.get(i)) ) {
          health = health - hf;
        }
      }
      for (int i = 0; i < team4.size(); i ++) {
        if (collision(team4.get(i)) ) {
          health = health - hf;
        }
      }
      if (health > split -50) {
        team3.add(new Sprite(x, y, name, columns, rows, team));
      }
      if (health <= 0) {
        team3.remove(this);
      }
      break;
    case 4:
      for (int i = 0; i < team1.size(); i ++) {
        if (collision(team1.get(i)) ) {
          health = health - hf -50;
        }
      }
      for (int i = 0; i < team2.size(); i ++) {
        if (collision(team2.get(i)) ) {
          health = health - hf;
        }
      }
      for (int i = 0; i < team3.size(); i ++) {
        if (collision(team3.get(i)) ) {
          health = health - hf;
        }
      }
      if (health > split - 50) {
        team4.add(new Sprite(x + (int)random(-50,50),(int)random(-50,50) +y, name, columns, rows, team));
      }
      if (health <= 0) {
        team4.remove(this);
      }
    }
  }
}