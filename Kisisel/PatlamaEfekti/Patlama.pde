ArrayList<ParticleSystem> pSist;
//ParticleSystem ps;
PVector gravity = new PVector(0,1.5);


void setup() {
  size(640, 360); 
  frameRate(60);  
  pSist=new ArrayList<ParticleSystem>();
  pSist.add(new ParticleSystem(new PVector(mouseX , mouseY)));
}

void draw() {
  background(0);
  for (int i=pSist.size()-1;i>=0;i--) {
    pSist.get(i).run();
    if (pSist.get(i).isOver()) {pSist.remove(i);}    
  }    
    
  
  fill(255);
  text("Frame Rate:" + frameRate , 10,20);
  text("PS Sayısı" + pSist.size() , 10,40);
  
  
}

void mousePressed() {
  pSist.add(new ParticleSystem(new PVector(mouseX , mouseY)));
  
  
}
