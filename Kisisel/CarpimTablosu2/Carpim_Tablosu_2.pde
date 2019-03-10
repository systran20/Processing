//10.03.2019 Omer ERMIS
//çarpım tablosu sonuçlarını grafiksel olarak simule etmek için tasarlanmış kutulardan oluşur.
//try to simulate the multiplication table diffent way

ArrayList<Kutu> kutular;
int size=20;
void setup() {
  size(400, 400);
  rectMode(CENTER);
  colorMode(HSB);
  kutular=new ArrayList<Kutu>();
  for (int i=1; i<11; i++) {
    for (int j=1; j<11; j++) {      
      kutular.add(new Kutu(i*(size+2)+5, j*(size+2)+5, i*j, size));
    }
  }
}

void draw() {
  background(0);
  for (Kutu k : kutular) {
    k.update();
    k.show();
  }
  hud();
}

void hud() {
  stroke(255);
  fill(255);
  textAlign(LEFT, CENTER);
  fill(255);
  text("Number of boxes:" + kutular.size(), 30, 370);
  text("FPS:" + int(frameRate), width-100, 370);
}
