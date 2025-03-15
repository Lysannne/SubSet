void settings()
{
  size(ScreenWidth, ScreenHeight);
}

void draw()
{
  DrawTitleScreen();
  SwitchScreen();
}

void keyPressed()
{
  if(currentScreen == TitleScreen)
  {
    currentScreen = GameScreen;
  }
}
