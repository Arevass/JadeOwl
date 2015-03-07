class Glob extends Object
{
  
  float globSpeed = 5;
  PVector velocity;
  
  Glob(float direction)
  {
    forward = new PVector(sin(direction), -cos(direction));
    velocity = PVector.mult(forward, globSpeed);
    alive = true;
    
    w = 20;
    h = 20;
  }
  
  void update()
  {
    if(pos.x < -20)
    {
      alive = false;
    }
    
    pos.add(velocity);
  }
  
  void display()
  {
    image(glob, pos.x, pos.y);
  }
}
