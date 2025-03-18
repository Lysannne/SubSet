final int GameBackgroundColor = #dbdbdb;
final int StatsBackgroundColor = #363636;

int SetsFound = 0;

void DrawStats()
{
  DrawRectangle(
  CORNER,
  ScreenWidth /2, 
  0,
  ScreenWidth /2,
  ScreenHeight,
  StatsBackgroundColor,
  StatsBackgroundColor,
  0
  );
  
  fill(255);
  textSize(25);
  textAlign(LEFT, TOP);
  text(
  "Kaarten gespeeld: " + (AmountOfCards - PlayOrder.size()),
  ScreenWidth/2 + 10,
  10
  );
  text(
  "Kaarten over: " + (PlayOrder.size()),
  ScreenWidth/2 + 10,
  40 
  );
  text(
  "Sets gevonden: " + SetsFound,
  ScreenWidth/2 + 10,
  70 
  );
}
