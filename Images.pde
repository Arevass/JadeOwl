PImage robot, robotThrust, ast, playerImage, bomber, wind, blackhole, lightning, alienImage, glob, fuel, splashScreen, endScreen, instructions;
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
  alienImage = loadImage("Alien.png");
  glob = loadImage("Glob.png");
  fuel = loadImage("Fuel.png");
  playerImage.resize(robotSize, robotSize);
  bomber.resize(robotSize, robotSize);
  ast.resize(robotSize, robotSize);
  alienImage.resize(robotSize, robotSize);
  glob.resize(pSize, pSize);
  fuel.resize(pSize, pSize);
  
  splashScreen = loadImage("SplashScreen.png");
  endScreen = loadImage("EndScreen.png");
  instructions = loadImage("Instructions.png");
  splashScreen.resize(width, height);
  endScreen.resize(width, height);
  
  wind = loadImage("Wind.png");
  wind.resize(pSize, pSize);
  blackhole = loadImage("BlackHole.png");
  blackhole.resize(pSize, pSize);
  lightning = loadImage("Lightning.png");
  lightning.resize(pSize, pSize);
  
  font = createFont("HighlandGothicFLF.ttf", 35);
}
