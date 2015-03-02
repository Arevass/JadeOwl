
ArrayList <Object> objects = new ArrayList <Object>();

ArrayList <Player> players = new ArrayList <Player>();
ArrayList <Wind> winds = new ArrayList <Wind>();
ArrayList <Debris> debris = new ArrayList <Debris>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Blackhole> holes = new ArrayList <Blackhole>();
PVector speed;
boolean xMovement, yMovement;
float bgRotation = 0;

void setup()
{
  size(1000, 500, P3D);
  stroke(255);
  fill(255);
  
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
  lights();
  
  bgRotation += 0.01f;
  
  stroke(255, 0, 0);
  pushMatrix();
  translate(width/2, height/2, -300);
  noFill();
  //rotateX(theta);
  rotateY(bgRotation);
  //rotateZ(theta);
  sphere(980);
  popMatrix();
  
  eventHorizon();
  
  for(Player p : players)
  {
    p.update();
    p.display();
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
  
  for(int i = 0; i < debris.size(); i ++)
  {
    debris.get(i).update();
    debris.get(i).display();
    
    if(!debris.get(i).alive)
    {
      debris.remove(i);
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
}

void eventHorizon()
{
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
  
  for(int i = 0; i < holes.size(); i++)
  {
    Blackhole b = holes.get(i);
    
    for(int j = 0; j < debris.size(); j++)
    {
      Debris d = debris.get(j);
      
      PVector distFrom = PVector.sub(b.pos, d.pos);
      float distance = distFrom.mag();
      distFrom.normalize();
      PVector pull = PVector.mult(distFrom, (500.0f / distance));
      d.pos.add(pull);
    }
  }
}

void keyPressed()
{
  if (key == 'w') { players.get(0).movement.y -= speed.y; yMovement = true; }
  if (key == 's') { players.get(0).movement.y += speed.y; yMovement = true; }
  if (key == 'a') { players.get(0).movement.x -= speed.y; xMovement = true; }
  if (key == 'd') { players.get(0).movement.x += speed.y; xMovement = true; }
  
  if (key == ' ')
  {
    Wind w = new Wind();
    winds.add(w);
  }
  
  if (key == 'e')
  {
    Blackhole b = new Blackhole();
    holes.add(b);
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

