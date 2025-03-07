final IntList CardNumbers = new IntList(1, 2, 3);
final IntList CardShapes = new IntList(1, 2, 3);
final IntList CardColors = new IntList(#0900b5, #00b527, #b500af);
final int AmountOfCards = 27; // 3 colors x 3 shapes x 3 numbers

int[] Numbers = new int[AmountOfCards];
int[] Colors = new int[AmountOfCards];
int[] Shapes = new int[AmountOfCards];

final int CardHeight = 100;
final int CardWidht = 60;
final int ShapeHeight = 10;
final int ShapeWidth = 40;

void InitializeCards()
{
  for (int i = 0; i < AmountOfCards; i++)
  {
    Numbers[i] = i % 3;
    Colors[i] = (i / 3) % 3;
    Shapes[i] = (i / (AmountOfCards / 3)) % 3;
  }
}

void DrawCards(int CardAmount)
{
  int rowCount = 1;
  int columnCount = 0;
  int cardIndex = 0;
  
  for(int i = 0; i < CardAmount; i++)
  {
    if(i / rowCount >= 9){ rowCount ++;  columnCount = 0;};
    
    int cardX = 10 + ((CardWidht + 40) * columnCount);
    int cardY = 10 + ((CardHeight + 40) * (rowCount -1));
    
    DrawCard(cardIndex, cardX, cardY);
    columnCount ++;
    cardIndex ++;
    
  };
  
}

void DrawCard(int index, int cardX, int cardY)
{
  int number = CardNumbers.get(Numbers[index]);
  int shapeColor = CardColors.get(Colors[index]);
  int shapeType = CardShapes.get(Shapes[index]);
  
  //base card
  DrawRectangle(CORNER, cardX, cardY, 60, 100, #ffffff, 10);
  int spacing = 100 / (number + 1);
  
  for(int i = 0; i < number; i++)
  {
    int shapeY = (i + 1) * spacing;
    
    //shape
    switch(shapeType)
    {
      case 1: 
        //DrawRectangle(CENTER, cardX + (CardWidht / 2), cardY + shapeY, 40, 15, shapeColor, 0);
        DrawSwirl(cardX+ (CardWidht / 2), cardY + shapeY, ShapeWidth, ShapeHeight, shapeColor);
       break;
       case 2: 
         DrawRectangle(CENTER, cardX + (CardWidht / 2),  cardY + shapeY, ShapeWidth, ShapeHeight, shapeColor, 30);
       break;
       case 3: 
         DrawQuad(
         cardX + 15, 
         cardY + shapeY,  
         cardX + (CardWidht/2), 
         (cardY + shapeY + (ShapeHeight/2)),
         cardX + 45, 
         cardY + shapeY,
         cardX + (CardWidht/2),
         (cardY + shapeY - (ShapeHeight/2)),
         shapeColor);
       break;
    }   
  }   
}
