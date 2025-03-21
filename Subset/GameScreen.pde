final int GAME_BACKGROUNDCOLOR = #dbdbdb;
final int STATS_BACKGROUNDCOLOR = #363636;

int SetsFound = 0;

void DrawStats()
{
  DrawRectangle(
  CORNER,
  SCREEN_WIDTH /2, 
  0,
  SCREEN_WIDTH /2,
  SCREEN_HEIGTH,
  STATS_BACKGROUNDCOLOR,
  STATS_BACKGROUNDCOLOR,
  0
  );
  
  fill(255);
  textSize(25);
  textAlign(LEFT, TOP);
  text(
  "Kaarten gespeeld: " + (AMOUNT_OF_CARDS - PlayOrder.size()),
  SCREEN_WIDTH/2 + 10,
  10
  );
  text(
  "Kaarten over: " + (PlayOrder.size()),
  SCREEN_WIDTH/2 + 10,
  40 
  );
  text(
  "Sets gevonden: " + SetsFound,
  SCREEN_WIDTH/2 + 10,
  70 
  );
}
