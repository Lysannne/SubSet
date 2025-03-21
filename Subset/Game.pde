void RestartGame()
{
  Numbers = new int[AMOUNT_OF_CARDS];
  Colors = new int[AMOUNT_OF_CARDS];
  Shapes = new int[AMOUNT_OF_CARDS];
  
  ShownCards.clear();
  PlayOrder.clear();
  SelectedCards.clear();
  
  SetsFound = 0;
  
  InitializeCards();  
  InitializePlayOrder();

}
