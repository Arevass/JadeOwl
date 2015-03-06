void collisionChecks()
{
  Player p = players.get(0);
    
  for(int i = 0; i < robots.size(); i++)
  {
    Robot r = robots.get(i);
    if(p.collisionCheck(r))
    {
      robots.remove(i);
      lives--;
      if(lives <= 0)
      {
        //end = true;
      }
    }
  }
  
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid a = asteroids.get(i);
    if(p.collisionCheck(a))
    {
      println("test");
      asteroids.remove(i);
      lives--;
      if(lives <= 0)
      {
        //end = true;
      }
    }
  }
  
  for(int i = 0; i < powerups.size(); i++)
  {
    PowerUps u = powerups.get(i);
    if(p.collisionCheck(u))
    {
      powerups.remove(i);
    }
  }
  
  if(bullets.size() > 0)
  {
    for(int j = 0; j < bullets.size(); j++)
    {
      
      Bullet b = bullets.get(j);
      
      for(int i = 0; i < robots.size(); i++)
      {
        Robot r = robots.get(i);
        if(b.collisionCheck(r))
        {
          robots.remove(i);
        }
      }
      /*
      for(int i = 0; i < aliens.size(); i++)
      {
        Alien a = aliens.get(i);
        if(e.collisionCheck(a))
        {
          aliens.remove(i);
        }
      }
      */
    }
  }
    
  for(int j = 0; j < holes.size(); j++)
  {
    
    Blackhole b = holes.get(j);
    
    for(int i = 0; i < robots.size(); i++)
    {
      Robot r = robots.get(i);
      if(b.collisionCheck(r))
      {
        robots.remove(i);
      }
    }
    
    for(int i = 0; i < asteroids.size(); i++)
    {
      Asteroid a = asteroids.get(i);
      if(b.collisionCheck(a))
      {
        asteroids.remove(i);
      }
    }
    /*
    for(int i = 0; i < aliens.size(); i++)
    {
      Alien a = aliens.get(i);
      if(b.collisionCheck(a))
      {
        aliens.remove(i);
      }
    }
    */
  }
  
  for(int j = 0; j < explosions.size(); j++)
  {
    
    Explosion e = explosions.get(j);
    
    for(int i = 0; i < asteroids.size(); i++)
    {
      Asteroid a = asteroids.get(i);
      if(e.collisionCheck(a))
      {
        asteroids.remove(i);
      }
    }
    
    for(int i = 0; i < robots.size(); i++)
    {
      Robot r = robots.get(i);
      if(e.collisionCheck(r))
      {
        robots.remove(i);
      }
    }
    /*
    for(int i = 0; i < aliens.size(); i++)
    {
      Alien a = aliens.get(i);
      if(e.collisionCheck(a))
      {
        aliens.remove(i);
      }
    }
    */
  }
}
