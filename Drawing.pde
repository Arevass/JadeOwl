void drawing()
{
  for(int i = 0; i < debris.size(); i ++)
  {
    debris.get(i).update();
    debris.get(i).display();
    
    if(!debris.get(i).alive)
    {
      debris.remove(i);
    }
  }
  
  for(Player p : players)
  {
    p.update();
    p.display();
  }
  
  for(int i = 0; i < robots.size(); i++)
  {
    robots.get(i).update();
    robots.get(i).display();
    
    if(!robots.get(i).alive)
    {
      robots.remove(i);
    }
  }
  
  for(int i = 0; i < explosions.size(); i++)
  {
    explosions.get(i).update();
    explosions.get(i).display();
    
    if(!explosions.get(i).alive)
    {
      explosions.remove(i);
    }
  }
  
  for(int i = 0; i < asteroids.size(); i++)
  {
    asteroids.get(i).update();
    asteroids.get(i).display();
    
    if(!asteroids.get(i).alive)
    {
      asteroids.remove(i);
    }
  }
  
  for(int i = 0; i < powerups.size(); i++)
  {
    powerups.get(i).update();
    powerups.get(i).display();
    
    if(!powerups.get(i).alive)
    {
      powerups.remove(i);
    }
  }
  
  for(int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).update();
    bullets.get(i).display();
    
    if(!bullets.get(i).alive)
    {
      bullets.remove(i);
    }
  }
  
  for(int i = 0; i < bombers.size(); i++)
  {
    bombers.get(i).update();
    bombers.get(i).display();
    
    if(!bombers.get(i).alive)
    {
      bombers.remove(i);
    }
  }
  
  for(int i = 0; i < winds.size(); i++)
  {
    winds.get(i).update();
    winds.get(i).display();
    
    if(!winds.get(i).alive)
    {
      winds.remove(i);
    }
  }
  
  for(int i = 0; i < holes.size(); i ++)
  {
    holes.get(i).update();
    holes.get(i).display();
    
    if(!holes.get(i).alive)
    {
      holes.remove(i);
    }
  }
  
  for(int i = 0; i < missiles.size(); i++)
  {
    missiles.get(i).update();
    missiles.get(i).display();
    
    if(!missiles.get(i).alive)
    {
      missiles.remove(i);
      launched = false;
    }
  }
}
