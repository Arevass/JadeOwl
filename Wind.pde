class Wind
{
  
  float lifespan = 5;
  float timer = 0;
  float tick = 0.05;
  
  boolean alive = true;
  
  PVector forward, fwoosh;
  float direction, strength;
  
  Wind()
  {
    //direction = random(0, 360);
    strength = random(1, 3);
    
    //Testing a right-to-left wind, also realised I have no idea what numbers represent a full circle, hence -1.6
    direction = -1.6;
    
    forward = new PVector(sin(direction), -cos(direction));
    
    fwoosh = PVector.mult(forward, strength);
  }
  
  void update()
  {
    timer += tick;
    
    if(frameCount % 30 == 0)
    {
      spawnDebris();
    }
    
    if(timer > lifespan)
    {
      alive = false;
    }
    
    players.get(0).pos.add(fwoosh);
  }
  
  void display()
  {
    
  }
  
  void spawnDebris()
  {
    Debris d = new Debris(fwoosh, direction);
    debris.add(d);
  }
  
}
