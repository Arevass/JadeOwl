class Blackhole extends Object
{
  
  float radius, bhRotation;
  
  Blackhole()
  {
    bhRotation = 0;
    
    alive = true;
    lifespan = 20;
    
    pos = new PVector(width / 2, height / 2);
  }
  
  void update()
  {
    bhRotation += 0.05f;
    timer += tick;
    
    if(timer > lifespan)
    {
      alive = false;
    }
  }
  
  void display()
  {
    stroke(255, 0, 255);
    
    pushMatrix();
    translate(pos.x, pos.y, 0);
    rotateX(bhRotation);
    rotateY(bhRotation);
    sphere(15);
    popMatrix();
  }
  
  boolean collisionCheck(Object e)
  {
    if(pos.x < e.pos.x + e.w && pos.x > e.pos.x && pos.y < e.pos.y + e.h && pos.y > e.pos.y)
    {
      return true;
    }
    
    return false;
    
  }
  
}
