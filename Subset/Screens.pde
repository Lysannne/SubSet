final int SCREEN_WIDTH = 800;
final int SCREEN_HEIGTH = 400;

final int LOGO_WIDTH = 400;
final int TITLESCREEN = 0;
final int GAMESCREEN = 1;
final int ENDSCREEN = 2;
int currentScreen = TITLESCREEN;

void DrawTitleScreen()
{
  background(TITLESCREEN_BACKGROUNDCOLOR);
  DrawLogo((SCREEN_WIDTH - LOGO_WIDTH)/2, 20); 
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

void DrawEndScreen()
{
  background(STATS_BACKGROUNDCOLOR);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(SetsFound + " sets gevonden!", SCREEN_WIDTH/2, 100);
  text("Druk op een willekeurige knop om terug naar het beginscherm te gaan", SCREEN_WIDTH/2, 200);
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
    case ENDSCREEN:
      DrawEndScreen();
      break;
      
  }
}
