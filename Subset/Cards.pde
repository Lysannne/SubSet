final IntList CARD_NUMBERS = new IntList(1, 2, 3);
final IntList CARD_SHAPES = new IntList(1, 2, 3);
final IntList CARD_COLORS = new IntList(#0900b5, #00b527, #b500af);

final int AMOUNT_OF_CARDS = 27; // 3 kleuren x 3 vormen x 3 nummers
final int CARD_BASECOLOR = #ffffff;

int[] Numbers = new int[AMOUNT_OF_CARDS];
int[] Colors = new int[AMOUNT_OF_CARDS];
int[] Shapes = new int[AMOUNT_OF_CARDS];

IntList ShownCards = new IntList();
IntList PlayOrder = new IntList();
IntList SelectedCards = new IntList();

IntList CardXCoordinates = new IntList();
IntList CardYCoordinates = new IntList();

final int ATTRIBUTE_POSSIBILITIES = 3;  

final int CARD_HEIGTH = 100;
final int CARD_WIDTH = 60;
final int SHAPE_HEIGTH = 10;
final int SHAPE_WIDTH = 40;

void InitializeCards() 
{
  for (int i = 0; i < AMOUNT_OF_CARDS; i++)
  {
    Numbers[i] = i % ATTRIBUTE_POSSIBILITIES;
    Colors[i] = (i / ATTRIBUTE_POSSIBILITIES) % ATTRIBUTE_POSSIBILITIES;
    Shapes[i] = (i / (AMOUNT_OF_CARDS / ATTRIBUTE_POSSIBILITIES)) % ATTRIBUTE_POSSIBILITIES;
  }
}

void InitializePlayOrder()
{
   PlayOrder = new IntList();

   //Kaarten toevoegen
  for (int i = 0; i < AMOUNT_OF_CARDS; i++)
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
  boolean IsSelected = false;
  
  CardXCoordinates.clear();
  CardYCoordinates.clear();
  
  for(int i = 0; i < ShownCards.size(); i++)
  {
    if(columnCount >= 3){ rowCount ++;  columnCount = 0;}
    
    int cardX = 50 + ((CARD_WIDTH + 40) * columnCount);
    int cardY = 10 + ((CARD_HEIGTH + 40) * rowCount);
    
    CardXCoordinates.append(cardX);
    CardYCoordinates.append(cardY);
    
    IsSelected = SelectedCards.hasValue(ShownCards.get(i));
    
    DrawCard(ShownCards.get(i), cardX, cardY, IsSelected);
    columnCount ++;  
    
  };  
}

void DrawCard(int index, int cardX, int cardY, boolean selected)
{
  int number = CARD_NUMBERS.get(Numbers[index]);
  int shapeColor = CARD_COLORS.get(Colors[index]);
  int shapeType = CARD_SHAPES.get(Shapes[index]);
  
  int cardStrokeColor = CARD_BASECOLOR;
  if(selected)
  {
    cardStrokeColor = #ff0000; //Rode rand als de kaart geselcteerd is
  }
  
  //Kaart
  DrawRectangle(CORNER, cardX, cardY, CARD_WIDTH, CARD_HEIGTH, CARD_BASECOLOR, cardStrokeColor, 10);
  int spacing = 100 / (number + 1);
  
  for(int i = 0; i < number; i++)
  {
    int shapeY = (i + 1) * spacing;
    
    //Vormen
    switch(shapeType)
    {
      case 1:        
        DrawSwirl(cardX+ (CARD_WIDTH / 2), cardY + shapeY, SHAPE_WIDTH, SHAPE_HEIGTH, shapeColor);
       break;
       case 2: 
         DrawRectangle(CENTER, cardX + (CARD_WIDTH / 2),  cardY + shapeY, SHAPE_WIDTH, SHAPE_HEIGTH, shapeColor, shapeColor, 30);
       break;
       case 3: 
         DrawQuad(
         cardX + 15, 
         cardY + shapeY,  
         cardX + (CARD_WIDTH/2), 
         (cardY + shapeY + (SHAPE_HEIGTH/2)),
         cardX + 45, 
         cardY + shapeY,
         cardX + (CARD_WIDTH/2),
         (cardY + shapeY - (SHAPE_HEIGTH/2)),
         shapeColor);
       break;
    }   
  }   
}

boolean CardsAreSet(int card1, int card2, int card3)
{ 
  if(!AttributesAreSet(Colors[card1], Colors[card2], Colors[card3])) return false;
  if(!AttributesAreSet(Shapes[card1], Shapes[card2], Shapes[card3])) return false;
  if(!AttributesAreSet(Numbers[card1], Numbers[card2], Numbers[card3])) return false;   
   
  return true;
}

boolean AttributesAreSet(int attribute1, int attribute2, int attribute3)
{
    if(attribute1 == attribute2 && attribute1 == attribute3) return true; //Allemaal hetzelfde
    if(attribute1 != attribute2 && attribute1 != attribute3 && attribute2 != attribute3) return true; //Allemaal anders
    return false;
}
