class Button
{
  float x;
  float y;
  int xSize;
  int ySize;
  boolean over = false;
  int bevel;
  
  Button(int X, int Y, int XSize, int YSize)
  {
    x = X;
    y = Y;
    xSize = XSize;
    ySize = YSize;
    bevel = width/64;
  }
  
  void drawButton() 
  { 
    background(bg);
    rectMode(CENTER);
    if (over())
    {
      fill(100);
      rect(x,y,xSize,ySize,bevel);
    }
    else
    {
      fill(155);
      rect(x,y,xSize,ySize,bevel);
    }
    if(bg == 200)
    {
     fill(0);
    }
    else
    {
      fill(255);
    }
     textAlign(CENTER,CENTER);
     textSize(width/32);
     text("Play", x, y);
     text("Use arrow keys to move paddle up and down", xMid, height*0.8); 
     textSize(width/16); //UPDATED
     text("IMPOSSIBLE PONG", xMid, height*0.2);
  }
  
  boolean over()
  {
    return (mouseX > x-(xSize/2) && mouseX < x+(xSize/2) && //TODO use dist()
      mouseY > y-(ySize/2) && mouseY < y+(ySize/2));
  }
  
  void checkButton() 
  {
    if(over()) 
    { 
      rectMode(CENTER);
      fill(255);
      rect(x,y,xSize,ySize, bevel);
      paused = false;
      rectMode(CORNER);  
    } 
  }
}
