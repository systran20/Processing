class Kutu {
  float x,y;  //
  float r=1;
  float rx=1;    //yarıçap X
  float ry=1;    //yarıçap Y
  
  boolean dead; 
  float yon;
  color renk;
  Kutu(float mx, float my) {    
    x= mx;
    y= my;    
    dead =false;
    yon=random(0.3,2.0);
    renk = color(random(255),random(255),random(255));
  }
  
  void update() {    
    if (r<0) {
      dead=true;
    }
    if ((x-r/2<0) || (x+r/2>width) || (y-r/2<0) || y+r/2>height) {
      //yon*=-1;
      dead=true;
    }
    
    if (!dead) {
      r+=yon;
    }
    
    
  }
  boolean isDead(){
    return dead;
  }
  
  void display() {    
    stroke(255);    
    //strokeWeight(2);
    noStroke();
    fill(renk,55);
    rectMode(CENTER);
    rect(x , y, r , r);
  }
}
