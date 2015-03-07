void spawning()
{
  if(frameCount % 60 == 0)
  {
    spawnRobot();
  }
  
  if(frameCount % 120 == 0)
  {
    spawnAsteroid();
  }
  
  if(frameCount % 600 == 0)
  {
    spawnPowerUp();
  }
  
  if(frameCount % 5 == 0)
  {
    spawnDebris();
  }
  
  if(frameCount % 540 == 0)
  {
    spawnAlien();
  }
  
  if(frameCount % 500 == 0)
  {
    spawnKamikaze();
  }
}

void spawnRobot()
{
  Robot r = new Robot();
  robots.add(r);
}

void spawnAsteroid()
{
  Asteroid a = new Asteroid();
  asteroids.add(a);
}

void spawnPowerUp()
{
  PowerUps u = new PowerUps();
  powerups.add(u);
}

void spawnDebris()
{
  Debris d = new Debris();
  debris.add(d);
}

void spawnAlien()
{
  Alien a = new Alien();
  aliens.add(a);
}

void spawnKamikaze()
{
  Kamikaze k = new Kamikaze();
  kamikazes.add(k);
}
