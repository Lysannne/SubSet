void settings()
{
  size(ScreenWidth, ScreenHeight);
}

void setup()
{
  InitializeCards();  
  InitializePlayOrder();
  DrawTitleScreen();
}

void draw()
{
 if(currentScreen == GameScreen)
 {
   DrawStats();
 }
}

void keyPressed()
{
  if(currentScreen == TitleScreen)
  {
    currentScreen = GameScreen;
    SwitchScreen();
  }
}

void mousePressed()
{
  if(currentScreen == GameScreen)
  {
    HandleCardClick();
  };
}
