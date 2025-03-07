final IntList CARD_NUMBERS = new IntList(1, 2, 3);
final IntList CARD_SHAPES = new IntList(1, 2, 3);
final IntList CARD_COLORS = new IntList(#0900b5, #00b527, #b500af);
final int AmountOfCards = 27; // 3 colors x 3 shapes x 3 numbers


void DrawCard(int number, int shapeColor, int shapeType)
{
  //base card
  DrawRectangle(1, 0, 0, 60, 100, #ffffff, 10);
  int spacing = 100 / (number + 1);
  
  for(int i = 0; i < number; i++)
  {
    int shapeY = (i + 1) * spacing;
    
    //shape
    switch(shapeType)
  {
    case 1: 
      DrawRectangle(3, 30, shapeY, 40, 15, shapeColor, 0);
     break;
     case 2: 
       DrawRectangle(3, 30, shapeY, 40, 15, shapeColor, 30);
     break;
     case 3: 
       DrawQuad(10, shapeY, 30, (shapeY + 7), 50, shapeY, 30, (shapeY - 7), shapeColor);
     break;
  }
    
    
  
  } 
  
}
