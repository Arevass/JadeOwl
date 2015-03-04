class Debris extends Object
{
  
  float len;
  
  Debris(PVector fwoosh, float direction)
  {
    this.fwoosh = fwoosh;
    this.direction = direction;
    len = random(0, 5);
    lifespan = 25;
    alive = true;
    
    pos = new PVector(0, random(5, height - 5));
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
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction);
    line(0, -len, 0, len);
    popMatrix();
  }
  
}
