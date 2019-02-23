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
   
  //saniyede 1 rastgele konumda PS nesnesi oluşturur.
  if ( int(frameCount % frameRate)==0) {
    pSist.add(new ParticleSystem(new PVector(random(width) , random(height))));  
  }
  
  fill(255);
  text("Frame Rate:" + frameRate , 10,20);
  text("Total Frame:" + frameCount , 10,40);
  
  text("PS Count:" + pSist.size() , width-80, 20);
  
  
}

void mousePressed() {
  pSist.add(new ParticleSystem(new PVector(mouseX , mouseY)));
  
  
}
