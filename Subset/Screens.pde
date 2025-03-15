final int ScreenWidth = 1260;
final int ScreenHeight = 500;

final int TitleScreen = 0;
final int GameScreen = 1;
int currentScreen = TitleScreen;

final int TitleScreenBackgroundColor = #b500af;
final int GameBackgroundColor = #dbdbdb;

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
  InitializeCards();  
  DrawCards(27);
}

void DrawLogo(int x, int y) 
{
  int fontSize = 105;
  int squareSize = int(fontSize * 1.2); 
  float spacing = squareSize * 0.1;
  
  textSize(fontSize);
  textAlign(CENTER, CENTER);
  
  // Zwarte vierkanten
  for (int i = 0; i < 3; i++) 
  {
    DrawRectangle(CORNER, 
                  int(x + i * (squareSize + spacing)), 
                  y, 
                  squareSize, 
                  squareSize, 
                  color(0), 
                  0);
  }
  
  // Witte vierkanten
  for (int i = 0; i < 3; i++) 
  {
    DrawRectangle(CORNER, 
                  int(x + i * (squareSize + spacing) + squareSize * 0.1), 
                  int(y + squareSize * 0.1), 
                  int(squareSize * 0.8), 
                  int(squareSize * 0.8), 
                  color(255), 
                  0);
   }
  
  // Letters
  fill(0);
  text("S", x + squareSize * 0.5, y + squareSize * 0.5);
  text("E", x + squareSize * 1.5 + spacing, y + squareSize * 0.5);
  text("T", x + squareSize * 2.5 + spacing * 2, y + squareSize * 0.5);
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
