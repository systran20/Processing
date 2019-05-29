class Circle{
  ArrayList<Circle> cons; 
  float x,y,r;
  float dx, dy;
  
  //CONSTRUCTOR
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    //r=random(.5 , 2.5);
    r = 0;
    dx = random(-1.5, 1.5);
    dy = random(-1.5, 1.5);
    cons = new ArrayList<Circle>();
    
  }
  
  void edges() {
    if (x-r<0 || x+r>width) {
      dx*=-1;
    }
    if (y-r<0 || y+r>height) {
      dy*=-1;
    }
  }
  
  void update() {
    x += dx;
    y += dy;
  }  
  void show() {
    noStroke();
    fill(255,150);
    ellipse(x , y , r*2 , r*2);
  }
  
}
