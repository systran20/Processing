class Box {
  PVector pos;
  PVector vel;
  PVector acc;
  color c;
  float w,h;
  int nHitCounter;
  boolean bDead=false;
  float t;
  
  Box(){
    //pos=new PVector(width/2,height/2);
    pos=new PVector(mouseX,mouseY);
    vel=new PVector(random(-4,4),random(-4,4));
    acc=new PVector(0,0);
    w=h=random(20,40);
    c=color(0);
    nHitCounter=0;
  }
  Box(PVector f){
    pos=f.copy();
    vel=new PVector(random(-4,4),random(-4,4));
    acc=new PVector(0,0);
    w=h=random(20,40);
    c=color(0);
    nHitCounter=0;
  }
  
  
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    //hit wall get more red
    if ((pos.x-w/2<0) || (pos.x+w/2>width)) {
      vel.x*=-1 ;      
      updateColor();
    }
    if ((pos.y-h/2<0) || (pos.y+h/2>height)) {
      vel.y*=-1 ;
      updateColor();
    }
    if (nHitCounter>3)  {
      bDead=true;      
    }
    
    if (isMouseOver()) {      
      setOVer();
    }    
    else {
      setNormal();
    }
    
  }
  void updateColor() {
    nHitCounter++;
    t=c >> 16 & 0xFF;    //fast way to calculate red value from RGB
    t+=nHitCounter*2;    
    c=color(t,0,0);
  }
  
  void display() {
    
    
    rectMode(CENTER);    
    fill(c);
    stroke(255);
    strokeWeight(2);
    rect(pos.x,pos.y, w,h);
    fill(255);
    textAlign(CENTER,CENTER);
    text(nHitCounter,pos.x,pos.y);
  }
  void setOVer() {
    c=color(0,255,0);
  }
  void setNormal() {    
    c=color(t,0,0);
  }
  boolean isMouseOver() {   
    
    return (mouseX>=pos.x-w/2) && (mouseX<=pos.x+w/2) && (mouseY>=pos.y-h/2) && (mouseY<=pos.y+h/2);           
  }  
  boolean isDead() { return bDead;}
}
