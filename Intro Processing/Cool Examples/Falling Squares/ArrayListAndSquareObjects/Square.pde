class Square {
  float x, y;
  float color_;
  float scale;
  float r;
  int posVar = 0;
  float x0, y0;
   
  Square(float _x, float _y, float c, float sc) {
    x = _x;
    y = _y;
    color_ = c;
    scale = sc;
  }
   
  void init() {
    x0 = x;
    y0 = y;
  }
   
  void move() {
    r += 0.01;
    posVar++;
    x = x0 + 20*sin(posVar*scale*PI/300);
    y = y0 + -20*tan(posVar*scale*PI/300);
      //x = x0 + 20;
   //y = y0 + -20;
  }
   
  void display() {
   pushMatrix();
    translate(x, y);
    scale(scale);
    rotate(r);
    fill(color_, 204, 204);
    rect(0, 0, 10, 10);
   popMatrix();
  }
}