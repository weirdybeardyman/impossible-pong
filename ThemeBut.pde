class ThemeBut
{
  float x;
  float y;
  int xSize;
  int ySize;
  boolean over = false;
  int bevel;
  boolean themeDark;
  
  ThemeBut(int X, int Y, int XSize, int YSize)
  {
    x = X;
    y = Y;
    xSize = XSize;
    ySize = YSize;
    bevel = width/64;
    themeDark = false;
  }
  
  void drawButton() 
  { 
    rectMode(CENTER);
    if (over()) //Not needed for Android but needed for web
    { 
      fill(100);
      rect(x,y,xSize,ySize,bevel);
      fill(0);
    }
    else
    {
       if(themeDark)
       {
         fill(255);
         rect(x,y,xSize,ySize,bevel);
         fill(0);
       }
       else
       {
         fill(0);
         rect(x,y,xSize,ySize,bevel);
         fill(255);
       }
    }
     textAlign(CENTER,CENTER);
     textSize(width/32);
     text("Theme", x, y);
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
      if(themeDark)
       {
         bg = 200;
       }
       else
       {
         bg = 0;
       }
       themeDark = !themeDark;
      rectMode(CORNER);  
    } 
  }
}
