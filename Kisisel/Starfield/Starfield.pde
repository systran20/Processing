final int YILDIZ=100;
final int ADET=30;
ArrayList<Nokta> noktalar=new ArrayList<Nokta>();
ArrayList<Cember> cemberler=new ArrayList<Cember>();
ArrayList<Kutu> kutular=new ArrayList<Kutu>();
void setup() {
  size(400, 400);
  //fullScreen();

  for (int i=0; i<YILDIZ; i++) {
    Nokta n=new Nokta();
    noktalar.add(n);
  }
  frameRate(60);
}

void draw() {
  background(0);
  for (int i=0; i<YILDIZ; i++) {
    noktalar.get(i).update();
    noktalar.get(i).display();
  }
  for (int i=cemberler.size()-1; i>0; i--) 
  {
    if (!cemberler.get(i).isDead()) {
      //print("slm");
      cemberler.get(i).update();
      cemberler.get(i).display();
    } else {
      cemberler.remove(i);
    }
  }
  
  for (int i=kutular.size()-1; i>0; i--) 
  {
    if (!kutular.get(i).isDead()) {
      //print("slm");
      kutular.get(i).update();
      kutular.get(i).display();
    } else {
      kutular.remove(i);
    }
  }
  
  if (frameCount%10==1) {
    Olustur();
  }
  //HUD
  textSize(10);
  stroke(255);
  fill(255);
  text("FPS:" + (int) frameRate, 10, 40);  //FPS
  text("Cember Adet:" + cemberler.size(), width-280, 40);  //Circle Count
  text("Kutu Adet:" + kutular.size(), width-280, 80);  //Circle Count
}
void mousePressed() {

  if (kutular.size()<ADET) {
    Kutu c=new Kutu(mouseX, mouseY);
    kutular.add(c);
  }
}
void Olustur() {
  if (cemberler.size()<ADET) {
    float tX=random(width);
    float tY=random(height);
    cemberler.add(new Cember(tX, tY));
  }
}
