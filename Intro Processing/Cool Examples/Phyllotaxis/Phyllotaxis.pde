float n = 0;
float c = 3;

void setup()
{
  size(600,600);
  noStroke();
  colorMode(HSB);
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  
  for(int i = 0; i < n; i++)//; NOfda;odwihf;aorwifh;arioha;dwoifhs:Odifvhna;sdofih
  {
    float angle = i * radians(137.5);
    float r = 10* sqrt(i);
    
    float x = r * cos(angle);
    float y = r * sin(angle);
    
    fill(i % 360, 255, 255);
    ellipse(x,y,5,5);
  }
  
  n+=5;
  
  if(mousePressed)
  {
    save("spiral.jpg");
  }
}