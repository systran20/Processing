class Cember {
  float x,y;  //
  float r=1;    //yarıçap
  boolean dead; 
  float yon;
  color renk;
  Cember(float mx, float my) {
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
    if ((x-r<0) || (x+r>width) || (y-r<0) || y+r>height) {
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
    ellipse(x , y, r*2 , r*2);
  }
}
