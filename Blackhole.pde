class Blackhole extends Object
{
  
  float radius, bhRotation;
  
  Blackhole()
  {
    bhRotation = 0;
    
    alive = true;
    lifespan = 20;
    
    firstMissile = false;
  }
  
  void update()
  {
    timer += tick;
    
    if(timer > lifespan)
    {
      alive = false;
    }
  }
  
  void display()
  {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, 25, 25);
  }
  
  boolean collisionCheck(Object e)
  {
    if(pos.x - 5 < e.pos.x + e.w && pos.x + 5 > e.pos.x && pos.y - 5 < e.pos.y + e.h && pos.y + 5 > e.pos.y)
    {
      return true;
    }
    
    return false;
    
  }
  
}

