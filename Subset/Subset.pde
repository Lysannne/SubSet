final int ScreenWidth = 1260;
final int ScreenHeight = 500;
final int BackgroundColor = #dbdbdb;

void settings()
{
  size(ScreenWidth, ScreenHeight);
}

void draw()
{
  background(BackgroundColor);
  InitializeCards();
  
  DrawCards(27);
}
