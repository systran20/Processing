class Circle extends PVector {
  float r;              //radius
  float gRate;          //grow rate
  float scareX,scareY;  //offset to scare
  color c;              //color 
  
  boolean growing = true;
  boolean alive=true;
  
  Circle(float x_, float y_) {
    super(x_,y_);
    r=1;
    c=color(random(255),random(255),random(255));
    gRate = random(0.1,1);
  }
  
  
  void show() {    
    stroke(255);
    strokeWeight(2);
    fill(c);
    rect(this.x + scareX , this.y + scareY, r*2, r*2);
  }
  
  boolean edges() {
    return (x-r-1<0 || x+r+1>width || y-r-1<0 || y+r+1>height);    
  }
  
  void grow() {
    if (growing) {
      r += gRate;
    }          
  }
  void alive() {
    //if mouse is close enough to scare me
    if (alive) {
      float dx = mouseX - x;
      float dy = mouseY - y;
      float d=sqrt(dx*dx + dy*dy);
      if (d < r+25) {
        scareX=random(1,15);
        scareY=random(1,15);
      }
      else {
        scareX=0;
        scareY=0;
      }
    }
    
    //color effect
    //if (alive) {
    //  c>>=1;
    //  if (c<10) {
    //    c=color(random(255),random(255),random(255));
    //  }
    //}
  }
  
  void checkMouseOver() {
    if (this.isMouseOver()) {
      c = color(255,150);      
    }
    else {
      c= color(0);
    }
  }
  
  boolean isMouseOver() {
    float dx= mouseX - x;
    float dy= mouseY - y;
    float d= sqrt(dx*dx + dy*dy);
    return (d < r);
  }
  
}
