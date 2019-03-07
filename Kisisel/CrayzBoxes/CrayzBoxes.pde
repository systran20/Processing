ArrayList<Box> boxes=new ArrayList<Box>();
final int nBoxCount=50;
void setup() {
  size(640, 360);
  frameRate(60);
  for (int i=0;i<nBoxCount ; i++) {
     boxes.add(new Box());
  }
}

void draw() {
  background(0); 
  for (int i = boxes.size() - 1; i >= 0; i--) {
    Box b = boxes.get(i);
    b.update();        
    b.display();
    if (b.isDead()) {
      boxes.remove(i);      
    }
  }
  
  if (boxes.size()<nBoxCount/2) {
    for (int i=0; i<int(random(1,5)); i++) {
      boxes.add(new Box());
    }
  }
  hud();
}

void hud() {
  textAlign(LEFT,CENTER);
  fill(255);
  text("Number of boxes:" + boxes.size(), 30,30);
  text("FPS:" + int(frameRate), width-100,30);
  
}
