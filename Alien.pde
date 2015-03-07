class Alien extends Object
{
  
  Alien()
  {
    pos = new PVector (width + 20, random(50, height));
    
    alive = true;
  }
  
  void update()
  {
    if(pos.x > width - 100) { pos.x --; } 
    else 
    { 
      if(pos.y < 50) { dirUp = false; } 
      if(pos.y > (height - 60)) { dirUp = true; } 
      if(dirUp) { pos.y -= 2; } else { pos.y += 2; } 
    }
    
    if(frameCount % 180 == 0)
    {
      shootGlob();
    }
  }
  
  void display()
  {
    image(alienImage, pos.x, pos.y);
  }
  
  void shootGlob()
  {
    Glob g = new Glob(radians(270));
    g.pos = pos.get();
    globs.add(g);
  }
  
}

