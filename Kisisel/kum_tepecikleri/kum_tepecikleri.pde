//KUM TEPECİKLER

Nokta noktalar[];
int adet=1000;
boolean space=false;
PVector wind=new PVector(0,-50);
void setup() {
  size(400, 400);  
  frameRate(90);
  noktalar=new Nokta[adet];
  for (int i=0; i<adet; i++) {
    noktalar[i]=new Nokta();
  }
}

void draw() {
  background(0);
  for (int i=0; i<adet; i++) {
    noktalar[i].update();    
    noktalar[i].display();
    if (space) {
      noktalar[i].applyForce(wind);
    }
  }
  hud();
}

void hud() {
  fill(255, 150);
  text(noktalar.length, 20, 20);
}

void keyPressed() {
  if (keyCode==32) {
    space=true;    
  }
}
void keyReleased() {
  if (keyCode==32) {
    space=false;
  }
}
