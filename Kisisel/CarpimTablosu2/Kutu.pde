class Kutu {

  int x, y, c;
  int size;
  PImage img;
  int[] dizi ;
  Kutu(int x_, int y_, int c_, int s_) {
    x = x_;
    y = y_;
    c = c_;
    size = s_;
    img = createImage(size, size, RGB);
    dizi=new int[size*size];  
    update();
  }


  void show() {
    image(img, x, y);
  }


  void update() {
    for (int i=0; i<size*size; i++) {      
      dizi[i]=color(random(360), 255, 255);
    }
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      if (i<c*c) {
        img.pixels[i] = dizi[i];
      } else {
        img.pixels[i] = 0;
      }
    }
    img.updatePixels();
    //show();
  }
}
