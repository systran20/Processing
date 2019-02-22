class Karakter {
  PVector pos;
  PVector speed;
  PVector acc;
  char c;
  boolean dead=false;
  float aci;
  Karakter(char w) {
    pos=new PVector(random(50,width-50), 0);
    speed=new PVector(0,0);
    acc=new PVector(0,0.1);
    c = w;
    aci=0;
  }
  
  void update() {
    speed.add(acc);
    pos.add(speed);
    aci+=0.1;
    if (pos.y>height) {
      dead=true;
    }
  }
  
  void display() {
    textSize(102);
    fill(0,255,0);
    pushMatrix();
    translate(pos.x , pos.y);        
    rotate(aci);
    text(c , 0,0);
    popMatrix();    
  }
  boolean isDead() {
    return dead;
  }
  
}
