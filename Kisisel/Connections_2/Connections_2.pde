

final int ADET=100;
Circle[] circles = new Circle[ADET];
PImage img;
void setup() {  
  //size(640, 360);
  fullScreen();
  img = loadImage("bg.jpg");  
  for (int i=0; i<ADET; i++) {
    circles[i]=new Circle(random(width), random(height));
  }
  strokeWeight(3);
}

void draw() {
  background(21);  
  for (int i=0; i<circles.length; i++) {
    circles[i].update();
    circles[i].edges();
    //circles[i].show();  

    for (int j=0; j<circles.length; j++) {
      if (i!=j) {
        float d=dist(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
        color c=int(random(255));
        if (d<50) {                
          stroke(50, c, 200, 255-d*5);
          line(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
          
        }
      }
    }
  }
  //HUD
  fill(255);
  textSize(12);
  text("TOTAL CIRCLE:" + ADET, 10, 10);
  text("FPS:" + int(frameRate), 10, 30);
  //text("Conn Count:" + totalLines, 10, 50);
}
