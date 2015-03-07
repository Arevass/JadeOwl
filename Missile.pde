class Missile extends Object
{
  
  float missileSpeed = 10;
  
  Missile(float direction)
  {
    forward = new PVector(sin(direction), -cos(direction));
    alive = true;
    lifespan = 10;
    
    this.direction = direction;
  }
  
  void update()
  { 
    if(pos.x > width)
    {
      alive = false;
    }
    
    PVector velocity = PVector.mult(forward, missileSpeed);
    pos.add(velocity);
  }
  
  void display()
  {
    fill(255, 0, 255);
    
    if(firstMissile)
    {
      text("E", pos.x - 20, pos.y - 20);
    }
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction);
    rect(0, 0, 7, 20);
    popMatrix();
  }
  
  void detonate()
  {
    Blackhole b = new Blackhole();
    b.pos = pos.get();
    holes.add(b);
  }
  
}

