final int SCREEN_WIDTH = 800;
final int SCREEN_HEIGTH = 400;

final int TITLESCREEN = 0;
final int GAMESCREEN = 1;
int currentScreen = TITLESCREEN;

void DrawTitleScreen()
{
  background(TITLESCREEN_BACKGROUNDCOLOR);
  DrawLogo((SCREEN_WIDTH - 400)/2, 20); //Logo is ongeveer 400 dus nu staat hij in het midden
  fill(0);
  textSize(20);
  text("Druk op een willekeurige knop om te starten", SCREEN_WIDTH/2, 200);
}

void DrawGameScreen()
{
  background(GAME_BACKGROUNDCOLOR);
  DrawStats();
  TakeCards(9);
  DrawCards();
}

void SwitchScreen()
{
  switch(currentScreen)
  {
    case TITLESCREEN:
      DrawTitleScreen();
      break;
    case GAMESCREEN:
      DrawGameScreen();
      break;
  }
}
