class Kamikaze extends Object
{
  float kamiSpeed = 5;
      
  Kamikaze()
  {
    pos = new PVector(width, random(0, height));
    alive = true;
    
    w = 50;
    h = 50;
  }
  
  void update()
  {
     PVector aim = new PVector();
     aim = new PVector(players.get(0).pos.x, players.get(0).pos.y);
     PVector tar = PVector.sub(aim, pos);
     tar.normalize();
     PVector chase = PVector.mult(tar, kamiSpeed);
     pos.add(chase);
    
  }
  
  void display()
  {
    fill(255);
    stroke(255);
    imageMode(CORNER);
    image(bomber, pos.x, pos.y);    
  }
}
