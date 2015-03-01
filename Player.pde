class Player
{
  PVector pos, movement;
  
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    movement = new PVector(0,0);
  }
  
  void update()
  {
    //Caps the player's speed at 5, will need to alter upon implementation of environmental effects
    
    if(movement.x > 5)  { movement.x = 5;  }
    if(movement.x < -5) { movement.x = -5; }
    if(movement.y > 5)  { movement.y = 5;  }
    if(movement.y < -5) { movement.y = -5; }
    
    //If the player isn't currently moving, this will gradually slow down the player
    
    if(!xMovement) {if(movement.x < 0) { movement.x += .1; }
                    if(movement.x > 0) { movement.x -= .1; } }
                    
    if(!yMovement) {if(movement.y < 0) { movement.y += .1; }
                    if(movement.y > 0) { movement.y -= .1; } }
                    
    //These four lines solve an issue with slight drift caused by the movement PVector holding values between .1 and 0
                    
    if(movement.x < .1 && movement.x > 0)  { movement.x = 0; }
    if(movement.x > -.1 && movement.x < 0) { movement.x = 0; }
    if(movement.y < .1 && movement.y > 0)  { movement.y = 0; }
    if(movement.y > -.1 && movement.y < 0) { movement.y = 0; }
    
    //This causes the player to bounce off the walls, in current state has a minor issue with getting stuck
                    
    //if(pos.x < 0 || pos.x > width)  { movement.x *= -1; }
    //if(pos.y < 0 || pos.y > height) { movement.y *= -1; }
    
    //This causes the player to appear on the other side of the game window upon hitting a wall, feels a bit better
    
    if(pos.x < 0)      { pos.x = width - 1; }
    if(pos.x > width)  { pos.x = 1; }
    if(pos.y < 0)      { pos.y = height - 1; }
    if(pos.y > height) {pos.y = 1; }
    
    println(movement);
    pos.add(movement);
  }
  
  void display()
  {
    ellipse(pos.x, pos.y, 25, 25);
  }
  
}
