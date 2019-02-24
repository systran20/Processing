class Cubuk extends Particle {

  // We could add variables for only Confetti here if we so

  Cubuk(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  void display() {
    rectMode(CENTER);
    fill(renk,lifespan);
    stroke(renk,lifespan);
    strokeWeight(4);
    pushMatrix();
    translate(position.x,position.y);
    float theta = map(position.x,0,width,0,TWO_PI*2);
    rotate(theta);
    line(0,0,12,12);
    popMatrix();
  }
}
