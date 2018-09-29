import processing.video.*;

Capture cam;
color place;
PImage hat;

void setup(){
  size(640, 480);
  hat = loadImage("piratehat.png");
  hat.resize(width/2, height/3);
  String[] cameras = Capture.list();
  println(cameras[1]);
   cam = new Capture(this, cameras[1]); 
   
   cam.start();
   place = color(0,0,0);
}

void draw(){
  if(cam.available()){
   cam.read();
   cam.filter(POSTERIZE, 2 + mouseX/10 % 253);
   set(0,0,cam);
   for(int x = 0; x < width; x = x + 4){
     for(int y = 0; y < height; y = y + 4){
       color c = cam.get(x, y);
        if(abs(red(c)-red(place))<10 && abs(green(c)-green(place))<10
        && abs(blue(c)-blue(place))<10){
           image(hat, x-width/5, y-height/4); 
           x = width;
           y = height;
        }
     }
   }
  }
}

void mouseReleased(){
   place = get(mouseX, mouseY); 
}
