class Debris extends Object
{
  
  float len;
  
  Debris()
  {
    direction = radians(270);
    strength = random(1, 3);

    len = random(0, 5);
    alive = true;
    
    pos = new PVector(width, random(35, height - 5));
    
    forward = new PVector(sin(direction), -cos(direction));
    fwoosh = PVector.mult(forward, strength);
  }
  
  void update()
  {  
    if(pos.x < 0)
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
