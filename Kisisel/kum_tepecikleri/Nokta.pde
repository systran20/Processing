class Nokta {
  PVector pos;
  PVector vel;
  PVector acc;
  color c;
  color siyah=color(0);

  Nokta() {
    pos = new PVector(width/2, 0);
    vel = new PVector(0 , 1);
    acc = new PVector(0,0);
    c=color(random(100, 200), random(100, 200), random(100, 200));
  }
  void display() {
    stroke(c);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
  void applyForce(PVector f) {
    vel.add(f);    
  }

  void update() {
    
    int alt=get(int(pos.x),int(pos.y)+1);
    int solalt=get(int(pos.x)-2,int(pos.y)+2);
    int sagalt=get(int(pos.x)+2,int(pos.y)+2);
    int sol=get(int(pos.x)-2,int(pos.y));
    int sag=get(int(pos.x)+2,int(pos.y));    
    if (alt==siyah) {
      pos.y+=1;        
      float r=random(1);
      if (r<0.1) {
        pos.x=(pos.x +random(-1,1)) % width;
      }
    }
    else if (solalt==siyah && sol==siyah) {
      pos.x-=1;
      pos.y+=1;
    }
    else if (sagalt==siyah && sag==siyah) {
      pos.x+=1;
      pos.y+=1;
    }
    else {
      
    }
  }
}
