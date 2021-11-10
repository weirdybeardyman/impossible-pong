class ScoreMan
{
  int playerScore;
  int aiScore;
  
  ScoreMan()
  {
    playerScore = 0;
    aiScore = 0;
  }
  
  void drawScore()
  {
    textAlign(CENTER);
    if(bg == 200) //UPDATED
    {
    fill(150);
    }
    else
    {
      fill(255);
    }
    textSize(width/16);
    text("Player: " + playerScore, width/4, width/16);
    text("COM: " + aiScore, width*0.75, width/16);
  }
  
  void playerScored()
  {
    playerScore++;
  }
  
  void aiScored()
  {
    aiScore++;
  }
  
  
  
}
