// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float lifeSpanSpeed;
  float r;
  color renk;

  Particle(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-5, 5), random(-10, -5));
    position = l.copy();
    lifespan = 255.0;
    lifeSpanSpeed= random(1, 50);
    r = random(1.0, 5.0);
    renk=color (random(25,255), random(25,255), random(25,255));
  }
  void applyForce(PVector force) {
    //PVector f = force.copy();    
    acceleration.add(force);  
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= lifeSpanSpeed;
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(renk, lifespan);    
    ellipse(position.x, position.y, r*2, r*2);
  }

  // konfeti nesnesinden çoğaltılmış farklı display
  void display2() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(0, 255, 0, lifespan);    
    pushMatrix();
    translate(position.x, position.y);
    float theta = map(position.x, 0, width, 0, TWO_PI*2);
    rotate(theta);
    ellipse(position.x, position.y, r*2, r*2);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
