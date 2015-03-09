
import ddf.minim.*;

AudioPlayer bgMusic;
Minim minim;

ArrayList <Player> players = new ArrayList <Player>();
ArrayList <Wind> winds = new ArrayList <Wind>();
ArrayList <Debris> debris = new ArrayList <Debris>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Kamikaze> kamikazes = new ArrayList <Kamikaze>();
ArrayList <Bomber> bombers = new ArrayList <Bomber>();
ArrayList <Explosion> explosions = new ArrayList <Explosion>();
ArrayList <Blackhole> holes = new ArrayList <Blackhole>();
ArrayList <Missile> missiles = new ArrayList <Missile>();
ArrayList <Robot> robots = new ArrayList <Robot>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <PowerUps> powerups = new ArrayList <PowerUps>();
ArrayList <Timer> timers = new ArrayList <Timer>();
ArrayList <Alien> aliens = new ArrayList <Alien>();
ArrayList <Glob> globs = new ArrayList <Glob>();
PVector speed;
boolean xMovement, yMovement;
boolean launched = false;
boolean firstMissile = true;
boolean stuck = false;
float time, lives, tengths, stuckTimer, score, currentTime, delay, scoreInc;
float Rcol, Gcol, Bcol = 0;
int currentPowerup;
int gameState = 0;

boolean devMode = false;

boolean sketchFullScreen()
{
  return ! devMode;
}

void setup()
{
  if(devMode)
  {
    size(1000, 500);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  
  stroke(255);
  fill(255);
  
  loadImages();
    
  minim = new Minim(this);
  bgMusic = minim.loadFile("GameMusic.mp3");
  
  bgMusic.loop();
  
  xMovement = false;
  yMovement = false;
  
  time = 5; lives = 5;
  tengths = width / 10;
  
  delay = 1000;
  
  Player p = new Player();
  speed = new PVector(5, 5);
  players.add(p);
}

void UI()
{
  
  fill(0);
  stroke(0);
  rect(0, 0, width, 35);
  
  fill(255);
  textFont(font);
  text("Fuel:", 10, 27);
  text("Life:", tengths * 3.2, 27);
  text("Score: " + score, tengths * 6.5, 27);
  rect(100, 5, 200, 20);
  rect(tengths * 4, 5, 200, 20);
  
  stroke(250, 90, 0);
  fill(250, 90, 0);
  rect(100, 5, 40*time, 20);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(tengths * 4, 5, 40*lives, 20);
  
  imageMode(CORNER);
  switch(currentPowerup)
  {
    case 0:
      break;
    case 1:
      image(wind, tengths * 9, 5);
      break;
    case 2:
      image(blackhole, tengths * 9, 5);
      break;
    default:
      break;
  }
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
  aliens.clear();
  globs.clear();
  timers.clear();
  kamikazes.clear();
  
  currentPowerup = 0;
  
  time = 5;
  lives = 5;
  score = 0;
  
  Player p = new Player();
  players.add(p);
}

void splashScreen()
{
  textFont(font, 20);
  stroke(255);
  fill(255);
  
  background(splashScreen);
}

void instructions()
{
  background(0);
  
  imageMode(CENTER);
  image(instructions, width / 2, height / 2);
}

void gamePlay()
{ 
  spawning();
  eventHorizon();
  drawing();
  UI();
  collisionChecks();
  gotStuck();
  
  if(millis() - currentTime >= delay)
  {
    scoreInc = 1;
    score += scoreInc;
    currentTime = millis();
  }
  
  if(frameCount % 700 == 0)
  {
      if(time > 0)
      {
        time --;
      }
      
      if(time <= 0)
      {
        gameState = 2;
      }
  }
}

void gameEnd()
{
  stroke(255);
  fill(255);
  
  background(endScreen);
}

void draw()
{
  background(0);  
  fill(0);
  stroke(0);
  
  switch(gameState)
  {
    case 0:
    splashScreen();
      break;
    case 1:
    gamePlay();
      break;
    case 2:
    gameEnd();
      break;
    case 3:
    instructions();
      break;
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
    
    for(int j = 0; j < robots.size(); j++)
    {
      Robot r = robots.get(j);
      
      PVector distFrom = PVector.sub(b.pos, r.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      r.pos.add(pull);
    }
    
    for(int j = 0; j < asteroids.size(); j++)
    {
      Asteroid a = asteroids.get(j);
      
      PVector distFrom = PVector.sub(b.pos, a.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      a.pos.add(pull);
    }
    
    for(int j = 0; j < aliens.size(); j++)
    {
      Alien a = aliens.get(j);
      
      PVector distFrom = PVector.sub(b.pos, a.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      a.pos.add(pull);
    }
    
    for(int j = 0; j < kamikazes.size(); j++)
    {
      Kamikaze k = kamikazes.get(j);
      
      PVector distFrom = PVector.sub(b.pos, k.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (1000.0f / distance));
      k.pos.add(pull);
    }
  }
}

void activatePowerup()
{
  switch(currentPowerup)
  {
    case 0:
      break;
    case 1:
      Wind w = new Wind();
      winds.add(w); 
      
      currentPowerup = 0;
      break;
    case 2:
      if(!launched)
      {
        players.get(0).shootMissile();
        
        launched = true;
      }
      else
      {
        missiles.get(0).detonate();
        
        launched = false;
        currentPowerup = 0;
        missiles.remove(0);
      }
      
      break;
    case 3:
      break;
    default:
      break;
  }
     
}

void gotStuck()
{ 
  stuckTimer += 0.05f;
  
  if(stuckTimer >= 3)
  {
    stuck = false;
  }
}

void keyPressed()
{
  if(!stuck)
  {
    if (key == 'w') { players.get(0).movement.y -= speed.y; yMovement = true; }
    if (key == 's') { players.get(0).movement.y += speed.y; yMovement = true; }
    if (key == 'a') { players.get(0).movement.x -= speed.x; xMovement = true; }
    if (key == 'd') { players.get(0).movement.x += speed.x; xMovement = true; }
  }
  if (key == ' ')
  { 
    if(gameState != 1)
    {
      resetGame();
      gameState = 1;
    }
  }
  
  if (key == 'e' || key == 'E')
  {
    activatePowerup();
  }
  
  if (key == 'i' || key == 'I')
  {
    gameState = 3;
  }
  
  if (key == 'p' || key == 'P')
  {
    fill(255);
    text("Press R to resume", (width / 2) - 30, height / 2);
    noLoop();
  }
  
  if (key == 'r' || key == 'R')
  {
    loop();
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

