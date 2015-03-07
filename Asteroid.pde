class Asteroid extends Object
{
  float angle;
  PVector velocity;
  float counter = 0;
  
  Asteroid()
  {
     PVector tag = new PVector(0, random(0, height));
        
     pos = new PVector (width, random(50,height));
     
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
    
    imageMode(CORNER);
    image(ast, pos.x, pos.y);

  }
  
  void update()
  {    
    if(pos.x < -50 || pos.x > width + 100)
    {
      alive = false;
    }

    pos.x--;
  }
  
}
