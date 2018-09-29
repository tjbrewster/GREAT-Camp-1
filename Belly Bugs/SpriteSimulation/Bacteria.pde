//ArrayList<Sprite> team1;
//ArrayList<Sprite> team2;
//ArrayList<Sprite> team3;
//ArrayList<Sprite> team4;
//void setup() {
//  size(500, 500);
//  team4 = new ArrayList<Sprite>();
//  team3 = new ArrayList<Sprite>();
//  team2 = new ArrayList<Sprite>();
//  team1 = new ArrayList<Sprite>();

//  int w = width - 20;
//  int h = height - 20;
//  for (int i = 0; i < 20; i++) {
//    team3.add(new Sprite((int)random(20, w), (int)random(20, h), "pinkEye1x12.png", 1, 12, 3));
//    team4.add(new Sprite((int)random(20, w), (int)random(20, h), "6BubonicPlague.png", 1, 6, 4));
//    team1.add(new Sprite((int)random(20, w), (int)random(20, h), "wolbachia 1by7.png", 1, 7, 1));  
//    team2.add(new Sprite((int)random(20, w), (int)random(20, h), "E.Coli_5x1.png", 4, 1, 2));
//  }
//}

//void draw() {
//  background(255);

//  for (int i =0; i < team2.size(); i ++) {

//    Sprite s = team2.get(i);
//    s.display(); 
//    s.move(5);
//    s.update();
//  }

//  for (int i = 0; i < team3.size(); i++) {

//    Sprite s = team3.get(i);
//    s.display();
//    s.move(5);
//    s.update();
//  }

//  for (int i =0; i < team4.size(); i ++) {
//    Sprite s = team4.get(i);
//    s.display();
//    s.move(5);
//    s.update();
//  }

//  for (int i = 0; i < team1.size(); i++) {
//    Sprite v= team1.get(i);
//    v.display();
//    v.move(5);
//    v.update();
//  }

//  fill(0);
//  text("E.Coli: " + team2.size(), 25, 25);
//  text("Pink Eye: " + team3.size(), 75, 25);
//  text("Plague: " + team4.size(), 150, 25);
//  text("Wolbachia: " + team1.size(), 225, 25);
//}