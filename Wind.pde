class Wind extends Object
{
  
  float strength;
  
  Wind()
  {
    direction = random(0, 360);
    strength = random(1, 3);
    
    alive = true;
    
    lifespan = 5;
    
    //Testing a right-to-left wind, also realised I have no idea what numbers represent a full circle, hence -1.6
    //direction = -1.6;
    
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
    //objects.add(d);
  }
  
}
