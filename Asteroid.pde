class Asteroid extends Object
{
  float angle;
  PVector velocity;
  float counter = 0;
  
  Asteroid()
  {
     PVector tag = new PVector(0, random(0, height));
        
     pos = new PVector (width-20, random(50,height));
     
     alive = true;

     /*angle = atan2(tag.y-pos.y, tag.x-pos.x);
      println(degrees(angle));
     forward = new PVector(sin(angle), -cos(angle));
     velocity = PVector.mult(forward, 5.0f);*/
  }
  
  void display()
  {
    /*
    pushMatrix();
    counter+=0.1;
    translate(pos.x, pos.y);
    rotate(counter*TWO_PI/360);
    translate(ast.width/2, ast.height/2);
    image(ast, 0, 0);
    popMatrix();
    */
    
    imageMode(CENTER);
    image(ast, pos.x, pos.y);
    //rect(pos.x, pos.y, 25, 25);

  }
  
  void update()
  {
    
    if(pos.x < 0)
    {
      alive = false;
    }
    
    if(pos.x + ast.width > 0)
    {
      //pos.add(velocity);
      pos.x--;
    }
    

  }
  
}
