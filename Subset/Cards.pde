final IntList CardNumbers = new IntList(1, 2, 3);
final IntList CardShapes = new IntList(1, 2, 3);
final IntList CardColors = new IntList(#0900b5, #00b527, #b500af);

final int AmountOfCards = 27; // 3 kleuren x 3 vormen x 3 nummers

int[] Numbers = new int[AmountOfCards];
int[] Colors = new int[AmountOfCards];
int[] Shapes = new int[AmountOfCards];

IntList ShownCards = new IntList();
IntList PlayOrder = new IntList();

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

void InitializePlayOrder()
{
   //Kaarten toevoegen
  for (int i = 0; i < AmountOfCards; i++)
  {
    PlayOrder.append(i);
  }

  // Random volgorde
  PlayOrder.shuffle();
}

void TakeCards(int amount)
{
  for(int i = 0; i < amount; i++)
  {
    int card = PlayOrder.get(0); //Pak bovenste kaart
    ShownCards.append(card); //Voeg toe aan kaarten op tafel
    PlayOrder.remove(0); //Verwijder van stapel
  }
}

void DrawCards()
{
  int rowCount = 0;
  int columnCount = 0;
  
  for(int i = 0; i < 9; i++)
  {
    if(columnCount >= 3){ rowCount ++;  columnCount = 0;};
    
    int cardX = 50 + ((CardWidht + 40) * columnCount);
    int cardY = 10 + ((CardHeight + 40) * rowCount);
    
    DrawCard(ShownCards.get(i), cardX, cardY);
    columnCount ++;  
    
  };  
}

void DrawCard(int index, int cardX, int cardY)
{
  int number = CardNumbers.get(Numbers[index]);
  int shapeColor = CardColors.get(Colors[index]);
  int shapeType = CardShapes.get(Shapes[index]);
  
  //Kaart
  DrawRectangle(CORNER, cardX, cardY, 60, 100, #ffffff, 10);
  int spacing = 100 / (number + 1);
  
  for(int i = 0; i < number; i++)
  {
    int shapeY = (i + 1) * spacing;
    
    //Vormen
    switch(shapeType)
    {
      case 1:        
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
