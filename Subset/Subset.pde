void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGTH);
}

void setup()
{
  InitializeCards();  
  InitializePlayOrder();
  DrawTitleScreen();
}

void draw()
{
 if(currentScreen == GAMESCREEN)
 {
   DrawStats();
 }
}

void keyPressed()
{
  if(currentScreen == TITLESCREEN)
  {
    currentScreen = GAMESCREEN;
    SwitchScreen();
  }
  else if(currentScreen == ENDSCREEN)
  {
    currentScreen = TITLESCREEN;
    SwitchScreen();
    RestartGame();
  }
}

void mousePressed()
{
  if(currentScreen == GAMESCREEN)
  {
    HandleCardClick();
  };
}
