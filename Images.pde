PImage robot, robotThrust, ast, playerImage, bomber, wind, blackhole, lightning;
int robotSize = 50;
int pSize = 30;
PFont font;


void loadImages()
{
  robot = loadImage("Robot.png");
  robotThrust = loadImage("RobotThrust.png");
  playerImage = loadImage("Player.png");
  bomber = loadImage("Ship2.png");
  ast = loadImage("Asteroid.png");
  playerImage.resize(robotSize, robotSize);
  bomber.resize(robotSize, robotSize);
  ast.resize(robotSize, robotSize);
  
  wind = loadImage("Wind.png");
  wind.resize(pSize, pSize);
  blackhole = loadImage("BlackHole.png");
  blackhole.resize(pSize, pSize);
  lightning = loadImage("Lightning.png");
  lightning.resize(pSize, pSize);
  //robot.resize(robotSize, robotSize);
  //robotThrust.resize(robotSize, robotSize);
  
  font = createFont("HighlandGothicFLF.ttf", 35);
}
