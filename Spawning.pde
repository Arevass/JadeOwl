void spawning()
{
  if(frameCount % 60 == 0)
  {
    spawnRobot();
  }
  
  if(frameCount % 180 == 0)
  {
    spawnAsteroid();
  }
  
  if(frameCount % 360 == 0)
  {
    spawnPowerUp();
  }
  
  if(frameCount % 5 == 0)
  {
    spawnDebris();
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
