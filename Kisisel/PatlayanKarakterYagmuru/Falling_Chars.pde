//22.02.2019 Ömer ERMİŞ
//klavyeden basılan tuşlar ekranın üstünden aşağıya düşüyormuş gibi görünecek
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();
ArrayList<Karakter> kler = new ArrayList<Karakter>();
PVector gravity=new PVector(0,0.07);
PVector wind=new PVector(0.01,0);
void setup() {
  size(640, 480);
  //fullScreen();
  noCursor();
  frameRate(100);
}

void draw() {
  background(0);
  ellipse(mouseX , mouseY , 40, 40);
  //loadPixels();
  //for (int i=0; i<width*height-1 ; i+=9) {
  //  pixels[i]=color(random(100,200));
  //}
  //updatePixels();
  
  int tmpS=kler.size();
  if (tmpS>0) {

    for (int i=kler.size()-1; i>=0; i--) {
      kler.get(i).update();
      kler.get(i).display();
      kler.get(i).applyForce(wind);
      if (kler.get(i).isDead()) {
        ps.add(new ParticleSystem(kler.get(i).getPos()));
        kler.remove(i);
        
      }
      
      
    }
  }  
  for (int i=ps.size()-1; i>=0; i--) {
    ps.get(i).run();
    ps.get(i).applyForce(gravity);
    ps.get(i).applyForce(wind);
    if (ps.get(i).isOver()) {
      ps.remove(i);    
    } 
      
    
  }
  
  textSize(12);
  
  
  fill(255);
  
  text("Frame Rate:" + int(frameRate), 10, 20);
  text("Total Frame:" + frameCount, 10, 40);

  text("Char Count:" + kler.size(), 400, 20);
  text("ParticleSystem Count:" + ps.size(), 400, 40);
  
}

void keyPressed() {
  char tmpChar = key ;
  //print(tmpChar);
  kler.add(new Karakter(tmpChar));
}
