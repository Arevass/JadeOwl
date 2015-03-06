
ArrayList <Object> objects = new ArrayList <Object>();

ArrayList <Player> players = new ArrayList <Player>();
ArrayList <Wind> winds = new ArrayList <Wind>();
ArrayList <Debris> debris = new ArrayList <Debris>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Bomber> bombers = new ArrayList <Bomber>();
ArrayList <Explosion> explosions = new ArrayList <Explosion>();
ArrayList <Blackhole> holes = new ArrayList <Blackhole>();
ArrayList <Missile> missiles = new ArrayList <Missile>();
ArrayList <Robot> robots = new ArrayList <Robot>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <PowerUps> powerups = new ArrayList <PowerUps>();
PVector speed;
boolean xMovement, yMovement;
boolean launched = false;
float time, lives, tengths;

void setup()
{
  size(1000, 500);
  //size(displayWidth, displayHeight);
  stroke(255);
  fill(255);
  
  loadImages();
  
  xMovement = false;
  yMovement = false;
  
  time = 5; lives = 5;
  tengths = width / 10;
  
  Player p = new Player();
  speed = new PVector(5, 5);
  players.add(p);
  objects.add(p);
}

void UI()
{
  rect(0, 0, width, 35);
  
  fill(255);
  textFont(font);
  text("Fuel:", 10, 27);
  text("Life:", tengths * 3.2, 27);
  rect(100, 5, 200, 20);
  rect(tengths * 4, 5, 200, 20);
  
  stroke(250, 90, 0);
  fill(250, 90, 0);
  rect(100, 5, 40*time, 20);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(tengths * 4, 5, 40*lives, 20);
  
  imageMode(CORNER);
  image(wind, tengths * 6.5, 5);
  image(blackhole, tengths * 7, 5);
  image(lightning, tengths * 7.5, 5);
  bomber.resize(pSize, pSize);
  image(bomber, tengths * 8, 5);
}

void resetGame()
{
  players.clear();
  winds.clear();
  debris.clear();
  bullets.clear();
  bombers.clear();
  explosions.clear();
  holes.clear();
  missiles.clear();
  robots.clear();
  asteroids.clear();
  powerups.clear();
  
  time = 5;
  lives = 5;
  //score = 0;
  
  Player p = new Player();
  players.add(p);
}

void draw()
{
  background(0);  
  fill(0);
  stroke(0);
  
  UI();
  spawning();
  eventHorizon();
  drawing();
  collisionChecks();
  
  if(frameCount % 700 == 0)
  {
      if(time > 0)
      {
        time --;
      }
  }
  
}

void eventHorizon()
{
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
  
  if (key == 'r')
  {
    Bomber b = new Bomber();
    bombers.add(b);
  }
  
  if (key == 't')
  {
    resetGame();
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

