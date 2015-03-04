class Blackhole extends Object
{
  
  float radius, bhRotation;
  
  Blackhole()
  {
    bhRotation = 0;
    
    alive = true;
    lifespan = 30;
    
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
  
}

