class Debris
{
  
  PVector fwoosh;
  PVector pos;
  float len, direction;
  
  boolean alive = true;
  
  float lifespan = 25;
  float timer = 0;
  float tick = 0.05;
  
  Debris(PVector fwoosh, float direction)
  {
    this.fwoosh = fwoosh;
    this.direction = direction;
    len = random(0, 5);
    
    pos = new PVector(width + 25, random(5, height - 5));
  }
  
  void update()
  {
    timer += tick;
    
    if(timer > lifespan)
    {
      alive = false;
    }
    
    pos.add(fwoosh);
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction);
    line(0, -len, 0, len);
    popMatrix();
  }
  
}
