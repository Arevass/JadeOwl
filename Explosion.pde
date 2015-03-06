class Explosion extends Object
{
  float radius;
  
  Explosion()
  {
    alive = true;
    lifespan = 10;
    
    radius = random(20, 40);
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
    ellipse(pos.x, pos.y, radius, radius);
  }
  
  boolean collisionCheck(Object e)
  {
    if(pos.x - radius < e.pos.x + e.w && pos.x + radius > e.pos.x && pos.y - radius < e.pos.y + e.h && pos.y + radius > e.pos.y)
    {
      return true;
    }
    
    return false;
    
  }
}
