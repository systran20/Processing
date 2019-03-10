//10.03.2019
//nested for loops
//çarpım tablosu
void setup() {
  size(760, 360);
}
void draw() {
  background(0);
  //console çıktısı verir
  for (int i=1; i<11; i++) {
    for (int j=1; j<11; j++) {
      print(i, "x" , j , "=" , nf(i*j,2));
    }
    println();
  }
  
  
  
  //ekrana çizer
  for (int i=1; i<11; i++) {
    for (int j=1; j<11; j++) {
      text(nf(i,2) + "x" + nf(j,2) + "=" + nf(i*j , 2), i*60+10, j*30+10);
    }
  }
  noLoop();
  
  
  
}
