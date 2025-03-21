final int TITLESCREEN_BACKGROUNDCOLOR = #b500af;

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
                  color(255), 
                  0);
   }
  
  // Letters
  fill(0);
  text("S", x + squareSize * 0.5, y + squareSize * 0.5);
  text("E", x + squareSize * 1.5 + spacing, y + squareSize * 0.5);
  text("T", x + squareSize * 2.5 + spacing * 2, y + squareSize * 0.5);
}
