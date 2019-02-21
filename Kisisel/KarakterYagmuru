//22.02.2019 Ömer ERMİŞ
//klavyeden basılan tuşlar ekranın üstünden aşağıya düşüyormuş gibi görünecek

ArrayList<Karakter> kler = new ArrayList<Karakter>();

void setup() {
  //size(640, 480);
  fullScreen();
  noCursor();
  frameRate(100);
}

void draw() {
  background(0);
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
      if (kler.get(i).isDead()) {
        kler.remove(i);
      }
    }
  }
  textSize(12);
  fill(255);
  textAlign(LEFT,CENTER);
  text(int(frameRate), 10, 10);
  text(kler.size(), 100, 10);
  
}

void keyPressed() {
  char tmpChar = key ;
  //print(tmpChar);
  kler.add(new Karakter(tmpChar));
}
