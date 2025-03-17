final int ScreenWidth = 800;
final int ScreenHeight = 400;

final int TitleScreen = 0;
final int GameScreen = 1;
int currentScreen = TitleScreen;

void DrawTitleScreen()
{
  background(TitleScreenBackgroundColor);
  DrawLogo((ScreenWidth - 400)/2, 20); //Logo is ongeveer 400 dus nu staat hij in het midden
  fill(0);
  textSize(20);
  text("Druk op een willekeurige knop om te starten", ScreenWidth/2, 200);
}

void DrawGameScreen()
{
  background(GameBackgroundColor);
  DrawStats();
  InitializeCards();  
  InitializePlayOrder();
  TakeCards(9);
  DrawCards();
}

void SwitchScreen()
{
  switch(currentScreen)
  {
    case TitleScreen:
      DrawTitleScreen();
      break;
    case GameScreen:
      DrawGameScreen();
      break;
  }
}
