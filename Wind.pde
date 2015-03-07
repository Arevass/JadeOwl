class Wind extends Object
{
  
  Wind()
  {
    direction = radians(90);
    strength = random(1, 3);
    
    alive = true;
    lifespan = 20;
    
    pos = players.get(0).pos;
    
    forward = new PVector(sin(direction), -cos(direction));
    fwoosh = PVector.mult(forward, strength);
  }
  
  void update()
  {
    timer += tick;
    
    if(timer > lifespan)
    {
      alive = false;
    }
    
    for (int i = 0; i < robots.size(); i++)
    {   
      robots.get(i).pos.add(fwoosh);
    }
    
    for (int i = 0; i < asteroids.size(); i++)
    {
      asteroids.get(i).pos.add(fwoosh);
    }
    
    for (int i = 0; i < aliens.size(); i++)
    {
      aliens.get(i).pos.add(fwoosh);
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    popMatrix();
  }
  
}
