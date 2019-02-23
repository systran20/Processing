class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  final int TOTAL=30; 

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
      particles.add(new Particle(origin));
      // half particle, half confetti
      //if (i< int(t/2)) {
      //  particles.add(new Particle(origin));
      //}
      //else {
      //  particles.add(new Confetti(origin));
      //}
      
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
