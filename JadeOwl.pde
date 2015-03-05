
ArrayList <Object> objects = new ArrayList <Object>();

ArrayList <Player> players = new ArrayList <Player>();
ArrayList <Wind> winds = new ArrayList <Wind>();
ArrayList <Debris> debris = new ArrayList <Debris>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Blackhole> holes = new ArrayList <Blackhole>();
ArrayList <Missile> missiles = new ArrayList <Missile>();
ArrayList <Robot> robots = new ArrayList <Robot>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <PowerUps> powerups = new ArrayList <PowerUps>();
PImage robot, robotThrust, ast, playerImage, wind, blackhole, lightning;
int robotSize = 50;
int pSize = 30;
PVector speed;
boolean xMovement, yMovement;
boolean launched = false;
float bgRotation = 0;
float time = 5;
float lives = 5;

PFont font;

void setup()
{
  //size(1000, 500, P3D);
  size(1000, 500);
  stroke(255);
  fill(255);
  
  robot = loadImage("Robot.png");
  robotThrust = loadImage("RobotThrust.png");
  playerImage = loadImage("Player.png");
  ast = loadImage("Asteroid.png");
  playerImage.resize(robotSize, robotSize);
  ast.resize(robotSize, robotSize);
  
  wind = loadImage("Wind.png");
  wind.resize(pSize,pSize);
  blackhole = loadImage("BlackHole.png");
  blackhole.resize(robotSize,robotSize);
  lightning = loadImage("Lightning.png");
  lightning.resize(pSize,pSize);
  //robot.resize(robotSize, robotSize);
  //robotThrust.resize(robotSize, robotSize);
  
  font = createFont("HighlandGothicFLF.ttf", 35);
  
  xMovement = false;
  yMovement = false;
  
  Player p = new Player();
  speed = new PVector(5, 5);
  players.add(p);
  objects.add(p);
}

void draw()
{
  background(0);  
  fill(0);
  stroke(0);
  rect(0, 0, width, 35);
  
  fill(255);
  textFont(font);
  text("Fuel:", 10, 27);
  text("Life:", width/2+20, 27);
  rect(100, 5, 200, 20);
  rect(width/2+100, 5, 200, 20);
  
  stroke(250, 90, 0);
  fill(250, 90, 0);
  rect(100, 5, 40*time, 20);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(width/2+100, 5, 40*lives, 20);
  
  if(frameCount % 700 == 0)
  {
      if(time > 0)
      {
        time --;
      }
  }
  
  if(frameCount % 180 == 0)
  {
    spawnRobot();
  }
  
  if(frameCount % 180 == 0)
  {
    spawnAsteroid();
  }
  
  if(frameCount % 180 == 0)
  {
    spawnPowerUp();
  }
  
  if(frameCount % 5 == 0)
  {
    spawnDebris();
  }
  
  eventHorizon();
  
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
  
  Player p = players.get(0);
    
  for(int i = 0; i < robots.size(); i++)
  {
    Robot r = robots.get(i);
    if(p.collisionCheck(r))
    {
      println("test");
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
      println("test");
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
      }
      
      for(int j = 0; j < holes.size(); j++)
      {
        
        Blackhole b = holes.get(j);
        
        for(int i = 0; i < asteroids.size(); i++)
        {
          Asteroid a = asteroids.get(i);
          if(b.collisionCheck(a))
          {
            asteroids.remove(i);
          }
        }
      }
  
  /*
  for(int i = 0; i < objects.size(); i++)
  {
    Object o = objects.get(i);
    
    o.update();
    o.display();
    
    if(!o.alive)
    {
      objects.remove(i);
    }
  }
  */
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

void eventHorizon()
{
  /*
  for(int i = 0; i < holes.size(); i++)
  {
    Blackhole b = holes.get(i);
    
    for(int j = 0; j < players.size(); j++)
    {
      Player p = players.get(j);
      
      PVector distFrom = PVector.sub(b.pos, p.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (500.0f / distance));
      p.pos.add(pull);
    }
  }
  */
  for(int i = 0; i < holes.size(); i++)
  {
    Blackhole b = holes.get(i);
    
    for(int j = 0; j < debris.size(); j++)
    {
      Debris d = debris.get(j);
      
      PVector distFrom = PVector.sub(b.pos, d.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      d.pos.add(pull);
    }
  }
  
  for(int i = 0; i < holes.size(); i++)
  {
    Blackhole b = holes.get(i);
    
    for(int j = 0; j < robots.size(); j++)
    {
      Robot r = robots.get(j);
      
      PVector distFrom = PVector.sub(b.pos, r.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      r.pos.add(pull);
    }
  }
  
  for(int i = 0; i < holes.size(); i++)
  {
    Blackhole b = holes.get(i);
    
    for(int j = 0; j < asteroids.size(); j++)
    {
      Asteroid a = asteroids.get(j);
      
      PVector distFrom = PVector.sub(b.pos, a.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      a.pos.add(pull);
    }
  }
}

void spawnRobot()
{
  Robot r = new Robot();
  robots.add(r);
  println("spawn");
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

void keyPressed()
{
  if (key == 'w') { players.get(0).movement.y -= speed.y; yMovement = true; }
  if (key == 's') { players.get(0).movement.y += speed.y; yMovement = true; }
  if (key == 'a') { players.get(0).movement.x -= speed.x; xMovement = true; }
  if (key == 'd') { players.get(0).movement.x += speed.x; xMovement = true; }
  
  //if (key == 'a') { players.get(0).direction -= 0.1f; xMovement = true; }
  //if (key == 'd') { players.get(0).direction += 0.1f; xMovement = true; }
  
  if (key == ' ')
  {
    Wind w = new Wind();
    winds.add(w);
  }
  
  if (key == 'e')
  {
    if(!launched)
    {
      players.get(0).shootMissile();
      
      launched = true;
    }
    else
    {
      missiles.get(0).detonate();
      
      launched = false;
      missiles.remove(0);
    }
  }
}

void keyReleased()
{
  if (key == 'w' || key == 's')
  {
    yMovement = false;
  }
  
  if (key == 'a' || key == 'd')
  {
    xMovement = false;
  }
}

