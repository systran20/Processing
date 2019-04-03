void setup() {
  size(400,400);                        //400x400 piksellik ekran oluşturur
}

void draw() {
  loadPixels();                         //piksellerle daha hızlı çalışmak için önce hafızaya yükle
  for (int i=0; i<width*height; i++) {  //WIDTH ekran genişliğini, HEIGHT yukseklik bilgisini verir.   
    pixels[i] = color(random(255));     //ekrandaki bütün pikselleri sırası ile rastgele RGB(0..255) aralığında renk yapar              
  }
  updatePixels();                       //Hafızadaki pikselleri ekrana basar 
}
