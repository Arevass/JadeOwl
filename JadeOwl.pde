
ArrayList <Player> players = new ArrayList <Player>();
ArrayList <Wind> winds = new ArrayList <Wind>();
PVector speed;
boolean xMovement, yMovement;

void setup()
{
  size(1000, 500);
  
  xMovement = false;
  yMovement = false;
  
  Player p = new Player();
  speed = new PVector(5, 5);
  players.add(p);
}

void draw()
{
  background(0);
  
  for(Player p : players)
  {
    p.update();
    p.display();
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

