//Introduces importing of external libraries with Processing's Sound Library

//You need to download the library first
//Sketch > Import Library > Add new Library > Search "sound" > Select Processing's Sound Library
import processing.sound.*;
TriOsc s;
SoundFile clap;
SoundFile poof;
SoundFile reet;

void setup() {
  size(500, 500);
  s = new TriOsc(this);
  clap = new SoundFile(this, "clap.mp3");
  poof = new SoundFile(this, "poof.mp3");
  reet = new SoundFile(this, "reet.mp3");
}

void keyPressed(){
   if(key == 'a'){
     clap.jump(1);
      clap.play();
   }else if(key == 's'){
      poof.play(); 
   } else if(key == 'd'){
    reet.play();
   }
}

void keyReleased(){
   if(key == 'a'){
      clap.play();
   }else if(key == 's'){
      poof.play(); 
   } else if(key == 'd'){
    reet.play();
   }
}

void draw() {
  background(0);
  if (mousePressed) {
    fill(mouseX*255/width, mouseY*255/height, 0);
    rect(mouseX-10, 0, 20, mouseY);
  }
}

void mousePressed() {
  s.play();
  s.freq(mouseX*440*2/width + 200);
  s.amp((float)(height-mouseY)/height);
}

void mouseDragged() {
  s.freq(mouseX*440*2/width + 200);
  s.amp((float)(height-mouseY)/height);
}

void mouseReleased() {
  s.stop();
}
