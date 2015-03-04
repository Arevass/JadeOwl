class Robot extends Object
{
  
  boolean thrust, dirUp;
  float robotSpeed;
  
  Robot()
  {
    pos = new PVector (width, height/2);
    thrust = false;
    dirUp = false;
    robotSpeed = 1;
    
    alive = true;
    
  }

  void display()
  {
    if (thrust == false)
    {
      image(robotThrust, pos.x, pos.y);
      println(pos);
      //println("test");
    }
    else
    {
      image(robot, pos.x, pos.y);
    }

  }
  
  void update()
  {
     if(pos.x + robotSize > 0)
      {
        --pos.x;
        pos.x *= robotSpeed;
      }
      
      if(pos.y == 50)
      {
        dirUp = false;
      }
      
      if(pos.y == (height-100))
      {
        dirUp = true;
      }
      
      if(dirUp == true)
      {
        pos.y -= 2;
      }
      
      if(dirUp == false)
      {
        pos.y += 2;
      }
        
      
     int randThrust = (int)random(120, 125);
     if(frameCount % randThrust ==0 || frameCount % (randThrust+1) ==0 || frameCount % (randThrust + 2)==0)
      { 
          thrust = true;
          pos.x-=10;
      }
      else
      {
        thrust = false;
      }
      /*
      else
      {
        change alive boolean to false
      }*/
  }
}

