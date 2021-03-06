class Bullet extends Object
{
  
  float bulletSpeed = 10;
  
  Bullet(float direction)
  {
    forward = new PVector(sin(direction), -cos(direction));
    alive = true;
    lifespan = 3;
    
    this.direction = direction;
  }
  
  void update()
  {
    
    if(pos.x > width)
    {
      alive = false;
    }
    
    PVector velocity = PVector.mult(forward, bulletSpeed);
    pos.add(velocity);
  }
  
  void display()
  {
    fill(0, 255, 125);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction);
    rect(0, 0, 5, 20);
    popMatrix();
    
  }
  
  boolean collisionCheck(Object e)
  {
    if(pos.x < e.pos.x + e.w && pos.x + 20 > e.pos.x && pos.y + 7 < e.pos.y + e.h && pos.y > e.pos.y)
    {
      return true;
    }
    
    return false;
    
  }
}
