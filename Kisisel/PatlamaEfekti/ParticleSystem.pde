class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  final int TOTAL=100; 

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
    addParticle(TOTAL);
  }
  
  void applyForce(PVector f) {
    for (Particle p: particles) {      
      p.applyForce(f);
    }
  }  
  
  void addParticle(int t) {
    for (int i=0; i<t; i++) {
      float r=random(1);
      if (r< 0.3) {
        particles.add(new Particle(origin));
      }
      else if (r<0.5) {
        particles.add(new Confetti(origin));
      }
      else if (r<0.8) {
        particles.add(new Cubuk(origin));
      }
      else {
        particles.add(new Nokta(origin));
      }
    }  
  }
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  boolean isOver() {
    if (particles.size()==0) {
      return true;
    }
    else {
      return false;      
    }
  }
}
