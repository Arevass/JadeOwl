class Timer extends Object
{
  
  float R, Rcent, a, a1, a2, G, Gcent, B, Bcent;
  boolean flash;
  
  Timer()
  {
    alive = true;
    lifespan = 5;
    
    scoreInc = 1.5;
    
    R = 125; Rcent = 125;
    a = PI / 2; a1 = PI; a2 = 3 * PI / 2;
    Rcol = 125; Gcol = 125; G = 125; Gcent = 125;
    Bcol = 125; B = 125; Bcent = 125;
    
    flash = true;
  }
  
  void update()
  {
    timer += tick;
    
    if(timer > lifespan)
    {
      alive = false;
      Rcol = 0; 
      Gcol = 0;
      Bcol = 0;
      
      scoreInc = 1;
    }
  }
  
  void display()
  {
      background(Rcol, Gcol, Bcol);
      Rcol = Rcent + R * sin(a);
      a += 0.06;
      
      Gcol = Gcent + G * sin(a1);
      a1 += 0.06;
      
      Bcol = Bcent + B * sin(a2);
      a2 += 0.06;
      
      score += scoreInc;
      println(score);
  }
}
