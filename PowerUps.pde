class PowerUps extends Object
{
  int image;
  PowerUps()
  {
     image = (int) random(1, 5);
     pos = new PVector(width - 20, random(50, height - h));
     
     alive = true;
  }
  
  void display()
  {
   
    imageMode(CORNER);
    
    if(image == 1)
    {
      pushMatrix();
      translate(pos.x, pos.y);
      image(wind, 0, 0);
      popMatrix();
    }
    if(image == 2)
    {
      pushMatrix();
      translate(pos.x, pos.y);
      image(blackhole, 0, 0);
      popMatrix();    
    }
    if(image == 3)
    {
      pushMatrix();
      translate(pos.x, pos.y);
      image(lightning, 0, 0);
      popMatrix();
    }
    if(image == 4)
    {
      pushMatrix();
      translate(pos.x, pos.y);
      image(fuel, 0, 0);
      popMatrix();
    }
  }
  
  void update()
  {
    if(pos.x + robotSize > 0)
    {
      pos.x--;
    }
    else
    {
      alive = false;
    }
  }
  
}
