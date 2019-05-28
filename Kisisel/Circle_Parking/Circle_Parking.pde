ArrayList<Circle> circles;
ArrayList<PVector> spots;
boolean s=false;

PImage img;
void setup() {  
  size(900, 400);
  //fullScreen();
  spots= new ArrayList<PVector>();

  img = loadImage("2017.png");  //900x400
  img.loadPixels();
  
  for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
      int index = x + y* img.width;
      color c = img.pixels[index];  //color of pixel
      float b = brightness(c);      //brightness of that pixel
      if (b>1) {
        spots.add(new PVector(x,y));
                
      }
    }
  }
  //println(spots.size());


  circles =new ArrayList<Circle>();
  circles.add(new Circle(200, 200));
}

void draw() {
  background(0);

  int total = 10;    //10 circle each frame
  int count = 0;
  int attemps=0;

  while (count<total && !s) {
    Circle newC = newCircle();
    if (newC!=null) {
      circles.add(newC);
      count++;
    }
    attemps++;
    //println(attemps);
    if (attemps>500) {      
      s=true;
      println("FINISHED");
      println("Number of Circles:" + circles.size());
      break;
    }
  }



  for (Circle c : circles) {
    if (c.growing) {
      if (c.edges()) {
        c.growing=false;
      } else {        
        for (Circle other : circles) {
          if (c!=other) {
            float d=dist(c.x, c.y, other.x, other.y);
            if (d-2<c.r+other.r) {
              c.growing=false;
              break;
            }
          }
        }
      }
    }
    //c.checkMouseOver();
    c.alive();
    c.show();
    c.grow();
  }
  
  //HUD
  fill(255);
  textSize(12);
  text("PRESS SPACE TO RESTART", 10,10);
}



Circle newCircle() {
  int r =int(random(0,spots.size()));
  PVector spot =spots.get(r);
  
  float x= spot.x;
  float y= spot.y;
  boolean valid = true;
  for (Circle c : circles) {
    float d = dist(x, y, c.x, c.y);  //yeni seçilen rastgele konumu, array listdeki cember konumu icindemi?
    if (d  < c.r +2) {
      valid=false;
      break;
    }
  }
  if (valid) {    
    return new Circle(x, y);
  } else {
    return null;
  }
}


void keyPressed() {  
  if (key==' ' &&  s==true) {
    println("RESTARTED");
    circles.clear();
    s=false;
    loop();
  }
}


