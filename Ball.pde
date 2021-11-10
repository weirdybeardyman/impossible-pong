class Ball
{
  ScoreMan score = new ScoreMan();

  PVector speed;
  float xPos;
  float yPos;
  int ballSize;
  float timeDelta;
  
  Ball()
  {
    spawnBall();
    ballSize = width/16;
  }
  
  void spawnBall()
  {
    speed = new PVector(random(1,2),random(-0.5f,-0.5f));
    float leftOrRight = random(1);
    if(leftOrRight > 0.5f)
    {
      speed.x = -speed.x;
    }
    speed.setMag(width/160);    
    xPos = xMid;
    yPos = random(ballSize,height-ballSize);
    timeDelta = 1;
  }
  
  void drawBall(Paddle player, Paddle ai)
  {
    if(!paused)
    {
      timeDelta += 0.002f;
      moveBall(player,ai);
    }
    score.drawScore();
    fill(255);
    ellipse(xPos, yPos, ballSize, ballSize);
  }
  

  void moveBall(Paddle player, Paddle ai)
  {
    //End zones
    if(xPos + (ballSize /2) >= width)
    {
      //speed.x = -speed.x;
      spawnBall();
      score.playerScored();
    }
    if(xPos - (ballSize /2) <= 0)
    {
      //speed.x = -speed.x;
      spawnBall();
      score.aiScored();
    }
    
    //Floor and Ceiling
    if(yPos + (ballSize /2) >= height || yPos - (ballSize /2) <= 0)
    {
      speed.y = -speed.y;
    }
 
    //UPDATED
   float padWidth = player.paddleWidth /2;
   float padHeight = player.paddleHeight /2;
   float pad1x = player.xPos + padWidth;
   float pad1y = player.yPos + padHeight;
   float pad2x = ai.xPos + padWidth;
   float pad2y = ai.yPos + padHeight;
   float[] xDists = new float[]{abs(xPos - pad1x), abs(xPos - pad2x)}; //Use a min method to only pick the closest one to check
   float[] yDists = new float[]{abs(yPos - pad1y), abs(yPos - pad2y)}; //Need to pick this one based on the x choice
   
   for(int i = 0; i < 2; i++)
   {
     if(xDists[i]-(ballSize/2) < padWidth && yDists[i]-(ballSize/2) < padHeight)
     {
       if(yDists[i] > padHeight) //Bounces off top or bottom
       {
         //calc paddle speed
         float paddleSpeed = player.moveSpeed * mouseRel;
         speed.y += (paddleSpeed/2);
         if((yPos - pad1y) * speed.heading() < 0) //TODO still bug, if move down when paddle is going above you can suck it in
         {
           speed.y = -speed.y;
         }
       }
       else //Bounces off face
       {
         speed.x = -speed.x;
       }
       break;
     }
   }
    
    xPos += speed.x * timeDelta;
    yPos += speed.y * timeDelta;
  }
 

}
