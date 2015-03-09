class Robot extends Object
{
  
  boolean thrust;
  float robotSpeed;
  int randThrust;
  
  Robot()
  {
    pos = new PVector (width, random(50, height));
    thrust = false;
    robotSpeed = 1;
    
    w = 25;
    h = 35;
    
    alive = true;
    
  }

  void display()
  {
    imageMode(CORNER);
    if (thrust == false)
    {
      image(robotThrust, pos.x, pos.y);
    }
    else
    {
      image(robot, pos.x, pos.y);
    }

  }
  
  void update()
  {
    
    if(pos.x < -w) { alive = false; }
    
    if(pos.x + robotSize > 0) { --pos.x; }
      
    if(pos.y <= 50) { dirUp = false; }
    if(pos.y >= height - 100) { dirUp = true; }

    
    if(dirUp) { pos.y -= 2; }
    else      { pos.y += 2; }
        
      
    randThrust = (int) random(120, 125);
    
    if(frameCount % randThrust == 0 || frameCount % (randThrust+1) == 0 || frameCount % (randThrust + 2) == 0)
    {
      thrust = true;
      pos.x -= 10;
    }
    else
    {
      thrust = false;
    }
  }
}

