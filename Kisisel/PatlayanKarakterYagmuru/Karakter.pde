class Karakter {
  PVector pos;
  PVector velocity;
  PVector acceleration;
  char c;
  color renk;
  boolean dead=false;
  boolean pop=false;
  float angle;

  //constructor
  Karakter(char gelen) {
    pos = new PVector(random(10, width-10), 0);    //y =0 en üstte başa
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.03);
    c = gelen ;
    renk = color(0, 255, 0);
    angle=0.1;
  }  
  void update() {
    velocity.add(acceleration);
    pos.add(velocity);
    angle+=0.04;
    //c+=int(random(-5,5));    

    if (pos.y>height ) {
      dead = true;
    }
  }
  void applyForce(PVector force) {
    PVector f = force.copy();
    velocity.x+=f.x;
  }
  
  PVector getPos() {
    return pos;
  }
  boolean isDead() {
    return dead;
  }  


  void display() {
    //fill(renk , 255-int(pos.y / height*255));
    fill(renk);
    textSize(32 - int(pos.y / height)*3);

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    text(c, 0, 0);
    popMatrix();
  }  
}
