final IntList CARD_NUMBERS = new IntList(1, 2, 3);
final IntList CARD_COLORS = new IntList(#0900b5, #00b527, #b500af);

void DrawCard(int Number)
{
  //base card
  DrawRectangle(1, 0, 0, 60, 100, #ffffff, 10);
  int spacing = 100 / (Number + 1);
  
  for(int i = 0; i < Number; i++)
  {
    int shapeY = (i + 1) * spacing;
    //shape
    DrawRectangle(3, 30, shapeY, 40, 15, #f500d0, 0);
  
  } 
  
}
