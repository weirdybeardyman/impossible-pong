class Paddle
{
  float xPos;
  float yPos;
  int paddleWidth;
  int paddleHeight;
  int bevel;
  float moveSpeed;
  
  boolean isPlayer;
  Ball ball;
  
  Paddle(boolean player, Ball b)
  {
    isPlayer = player;
    paddleWidth = (height + width)/50; //UPDATED
    paddleHeight = (height + width)/16; 
    moveSpeed = height/80;
    ball = b;
    yPos = yMid - (paddleHeight /2);
    
    int paddleOffset = int(width/10);
    
    if(isPlayer)
    {
      xPos = paddleOffset;
    }
    else
    {
      xPos = width-paddleOffset;
    }
    
  }
  
  void drawPaddle()
  {
    movePaddle();
    fill(255);
    rect(xPos, yPos, paddleWidth, paddleHeight, bevel);
  }
  
  float ballsLastx;
  float ballsLasty;

  void movePaddle()
  {
    if(isPlayer)
    {
      if(keyPressed && key == CODED)    //TODO check if on borders
      {
        if(keyCode == UP && !isAtTop())
        {
          yPos -= moveSpeed;
        }
        if(keyCode == DOWN && !isAtBottom())
        {
          yPos += moveSpeed;
    
        }
      }
    }
    else
    {
      //Maybe add some random gitter for lower difficulties
      float ballx = ball.xPos;
      float bally = ball.yPos;
      yPos += moveSpeed * AiMove(ballx, bally);
      ballsLastx = ballx;
      ballsLasty = bally;
    }
  }
  
  int AiMove(float ballx, float bally)
  {
      PVector ballVect = ball.speed;
      if(ballx < ballsLastx)
      {
        //move to center
        //am above or below center
        if(yPos < yMid - (paddleHeight / 2) - deadzone)//UPDATED
        {
           return 1;
        }
        else if(yPos > yMid - (paddleHeight / 2) + deadzone)
        {
           return -1;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        float xDistToBall = xPos - ballx;
        float TargetY = ((xDistToBall/ballVect.x)*ballVect.y)+bally;  
        TargetY -= paddleHeight / 2;
        if(TargetY<0)
        {
          TargetY = abs(TargetY);
        }
        if(TargetY > height)
        {
          TargetY -= abs(TargetY - height);
        }
        
        //Move to TargetY
        //am above or below target
        if(yPos < TargetY - deadzone) //UPDATED
        {
           return 1;
        }
        else if(yPos > TargetY + deadzone)
        {
           return -1;
        }
        else
        {
          return 0;
        }
      }
  }
  
  boolean isAtTop()
  {
    if(yPos <= 0)
    return true;
    else
    return false;
  }
  
  boolean isAtBottom()
  {
    if(yPos + paddleHeight >= height)
    return true;
    else
    return false;
  }
  
  

}
