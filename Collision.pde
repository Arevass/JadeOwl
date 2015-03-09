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
        gameState = 2;
      }
    }
  }
  
  for(int i = 0; i < aliens.size(); i++)
  {
    Alien a = aliens.get(i);
    if(p.collisionCheck(a))
    {
      aliens.remove(i);
      lives--;
      if(lives <= 0)
      {
        gameState = 2;
      }
    }
  }
  
  for(int i = 0; i < kamikazes.size(); i++)
  {
    Kamikaze k = kamikazes.get(i);
    if(p.collisionCheck(k))
    {
      kamikazes.remove(i);
      lives--;
      if(lives <= 0)
      {
        gameState = 2;
      }
    }
  }
  
  for(int i = 0; i < globs.size(); i++)
  {
    Glob g = globs.get(i);
    if(p.collisionCheck(g))
    {
      globs.remove(i);
      stuckTimer = 0;
      stuck = true;
    }
  }
  
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid a = asteroids.get(i);
    if(p.collisionCheck(a))
    {
      asteroids.remove(i);
      lives--;
      if(lives <= 0)
      {
        gameState = 2;
      }
    }
  }
  
  for(int i = 0; i < powerups.size(); i++)
  {
    PowerUps u = powerups.get(i);
    if(p.collisionCheck(u))
    {
      if(currentPowerup == 0)
      {
        if(u.image < 3)
        {
          currentPowerup = u.image;
        }
        
        if(u.image == 3)
        {
          Timer t = new Timer();
          timers.add(t);
        }
        
        if(u.image == 4)
        {
          if(time < 5)
          {
            time = 5;
          }
        }
      }
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
      
      for(int i = 0; i < aliens.size(); i++)
      {
        Alien a = aliens.get(i);
        if(b.collisionCheck(a))
        {
          aliens.remove(i);
        }
      }
      
      for(int i = 0; i < kamikazes.size(); i++)
      {
        Kamikaze k = kamikazes.get(i);
        if(b.collisionCheck(k))
        {
          kamikazes.remove(i);
        }
      }
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
    
    for(int i = 0; i < aliens.size(); i++)
    {
      Alien a = aliens.get(i);
      if(b.collisionCheck(a))
      {
        aliens.remove(i);
      }
    }
    
    for(int i = 0; i < kamikazes.size(); i++)
    {
      Kamikaze k = kamikazes.get(i);
      if(b.collisionCheck(k))
      {
        kamikazes.remove(i);
      }
    }
    
  }
  /*
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
    
    for(int i = 0; i < aliens.size(); i++)
    {
      Alien a = aliens.get(i);
      if(e.collisionCheck(a))
      {
        aliens.remove(i);
      }
    }
  }
  */
}
