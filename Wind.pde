class Wind extends Object
{
  
  float strength;
  
  Wind()
  {
    direction = radians(90);
    strength = random(1, 3);
    
    alive = true;
    lifespan = 5;
    
    pos = players.get(0).pos;
    
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
    
    //players.get(0).pos.add(fwoosh);
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    popMatrix();
  }
  
  void spawnDebris()
  {
    Debris d = new Debris(fwoosh, direction);
    debris.add(d);
    //objects.add(d);
  }
  
}
