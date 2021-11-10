Button but;
ThemeBut theme;
Ball ball;
Paddle player;
Paddle ai;

int xMid;
int yMid;

boolean paused = true;

int mouseRel;
float deadzone = 10;

color bg = 200; 
color main = 255;

void setup()
{
  //size(600,600);
  fullScreen();
  frameRate(60);
  xMid = int(width/2);
  yMid = int(height/2);
  but = new Button(xMid,yMid,width/8,width/16);
  theme = new ThemeBut(width/10,yMid,width/8,width/16);
  ball = new Ball();
  player = new Paddle(true, ball);
  ai = new Paddle(false, ball);
}

void draw()
{
  background(bg);
  player.drawPaddle();
  ai.drawPaddle();
  ball.drawBall(player, ai);
  if(paused)
  {
    but.drawButton();
    theme.drawButton();
  }
}

void mousePressed() 
{
  if(paused)
  {
    but.checkButton();
    theme.checkButton();
  }
}
//TODO add mouse position detection, take y value and go up or down if greater or smaller
void mouseDragged() 
{
  if(mouseY > player.yPos)
  {
    mouseRel = 1;
  }
  else if(mouseY < player.yPos)
  {
    mouseRel = -1;
  }
}
