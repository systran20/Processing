class Nokta { 
  float x,y;
  color renk;
  float o;    //opacity 0-255
  float d;    // +/- direction
  int w;    //stroke weight
  Nokta () {
    x = random(0,width);
    y = random(0,height);
    renk = color (random(0,255),random(0,255),random(0,255));
    //renk = color (255,255,255);
    d = random(1,5);
    w = (int) random(4,18);
    
  }
  
  void update() {
    x+=random(-0.5 , 0.5);
    y+=random(-0.5 , 0.5);
    o+=d;
    if (o>255)  {
      d*=-1;
    }
    if (o<0) {
      d*=-1;
    }
    
  }
  void display() {
    strokeWeight(w);
    stroke(renk, o);
    point(x,y);
  }

}
