class Player extends Object
{
  
  PVector movement;
  float maxSpeed;
  
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    movement = new PVector(0,0);
    
    direction = 0.0f;
    
    maxSpeed = 10;
  }
  
  void update()
  {
    
    forward = new PVector(sin(direction), -cos(direction));
    
    //Caps the player's speed at 10, will need to alter upon implementation of environmental effects
    
    if(movement.x > maxSpeed)  { movement.x = maxSpeed;  }
    if(movement.x < -maxSpeed) { movement.x = -maxSpeed; }
    if(movement.y > maxSpeed)  { movement.y = maxSpeed;  }
    if(movement.y < -maxSpeed) { movement.y = -maxSpeed; }
    
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
    if(pos.y > height) { pos.y = 1; }
    
    println(movement);
    pos.add(movement);
    
    if(frameCount % 10 == 0)
    {
      //shoot();
    }
  }
  
  void display()
  {
    //fill(255);
    
    stroke(255, 0, 0);
    
    pushMatrix();
    translate(pos.x, pos.y, 0);
    //noFill();
    sphere(25);
    popMatrix();
    
    /*
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction);
    rect(-10, -10, 10, 10);
    popMatrix();
    */
  }
  
  void shoot()
  {
    Bullet bullet = new Bullet(1.6);
    bullet.pos = pos.get();
    bullets.add(bullet);
    //objects.add(bullet);
  }
  
  void shootMissile()
  {
    Missile m = new Missile(radians(90));
    m.pos = pos.get();
    missiles.add(m);
  }
  
}
