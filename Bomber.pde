class Bomber extends Object
{
  
  PVector aim, tar, strafe;
  float bomberSpeed = 10;
  float theta;
  int rand, randWidth;
  
  Bomber()
  {
    rand = (int) random(0, 1);
    randWidth = (int) random(0, width);
    
    alive = true;
    
    if(rand == 0)
    {
      pos = new PVector(randWidth, 0);    
      aim = new PVector(width - randWidth, height);
    }
    else
    {
      pos = new PVector(randWidth, height);
      aim = new PVector(width - randWidth, 0);
    }
    
    theta = atan2(aim.y - pos.y, aim.x - pos.x);
    
    tar = PVector.sub(aim, pos);
    tar.normalize();
    
    strafe = PVector.mult(tar, bomberSpeed);
  }
  
  void update()
  { 
    if(frameCount % 10 == 0)
    {
      dropBomb();
    }
    
    if(pos.y > height || pos.y < 0)
    {
      alive = false;
    }
    
    pos.add(strafe);
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta + PI);
    imageMode(CENTER);
    bomber.resize(robotSize, robotSize);
    image(bomber, 0, 0);
    popMatrix();
  }
  
  void dropBomb()
  {
    Explosion e = new Explosion();
    e.pos = pos.get();
    explosions.add(e);
  }
  
}
