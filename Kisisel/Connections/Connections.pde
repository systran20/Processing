ArrayList<Circle> circles;
final int ADET=70;
PImage img;
void setup() {  
  size(640, 360);
  img = loadImage("bg.jpg");
  circles =new ArrayList<Circle>();
  for (int i=0; i<ADET; i++) {
    circles.add(new Circle(width/2, height/2));
  }  
}

void draw() {
  background(51);
  for (Circle c : circles) {
    c.update();
    c.edges();
    c.show();   
    
    
    for (Circle other: circles) {      
      if (c!=other) {
        float d=dist(c.x, c.y, other.x,other.y);
        if (d<50) {                
          stroke(255,0,0, 255-d*5);
          line(c.x,c.y , other.x,other.y);
          noStroke();          
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
