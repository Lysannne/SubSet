final IntList CardNumbers = new IntList(1, 2, 3);
final IntList CardShapes = new IntList(1, 2, 3);
final IntList CardColors = new IntList(#0900b5, #00b527, #b500af);

final int AmountOfCards = 27; // 3 kleuren x 3 vormen x 3 nummers
final int CardBaseColor = #ffffff;

int[] Numbers = new int[AmountOfCards];
int[] Colors = new int[AmountOfCards];
int[] Shapes = new int[AmountOfCards];

IntList ShownCards = new IntList();
IntList PlayOrder = new IntList();
IntList SelectedCards = new IntList();

IntList CardXCoordinates = new IntList();
IntList CardYCoordinates = new IntList();

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
   PlayOrder = new IntList();

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
  boolean IsSelected = false;
  
  CardXCoordinates.clear();
  CardYCoordinates.clear();
  
  for(int i = 0; i < ShownCards.size(); i++)
  {
    if(columnCount >= 3){ rowCount ++;  columnCount = 0;}
    
    int cardX = 50 + ((CardWidht + 40) * columnCount);
    int cardY = 10 + ((CardHeight + 40) * rowCount);
    
    CardXCoordinates.append(cardX);
    CardYCoordinates.append(cardY);
    
    IsSelected = SelectedCards.hasValue(ShownCards.get(i));
    
    DrawCard(ShownCards.get(i), cardX, cardY, IsSelected);
    columnCount ++;  
    
  };  
}

void DrawCard(int index, int cardX, int cardY, boolean selected)
{
  int number = CardNumbers.get(Numbers[index]);
  int shapeColor = CardColors.get(Colors[index]);
  int shapeType = CardShapes.get(Shapes[index]);
  
  int cardStrokeColor = CardBaseColor;
  if(selected)
  {
    cardStrokeColor = #ff0000; //Rode rand als de kaart geselcteerd is
  }
  
  //Kaart
  DrawRectangle(CORNER, cardX, cardY, CardWidht, CardHeight, CardBaseColor, cardStrokeColor, 10);
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
         DrawRectangle(CENTER, cardX + (CardWidht / 2),  cardY + shapeY, ShapeWidth, ShapeHeight, shapeColor, shapeColor, 30);
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

boolean CardsAreSet(int card1, int card2, int card3)
{ 
  if(!ColorsAreSet(Colors[card1], Colors[card2], Colors[card3])) return false;
  if(!ShapesAreSet(Shapes[card1], Shapes[card2], Shapes[card3])) return false;
  if(!NumbersAreSet(Numbers[card1], Numbers[card2], Numbers[card3])) return false;   
   
  return true;
}

boolean ColorsAreSet(int color1, int color2, int color3)
{
    if(color1 == color2 && color1 == color3) return true; //Allemaal dezelfde kleur
    if(color1 != color2 && color1 != color3 && color2 != color3) return true; //Allemaal andere kleur
    return false;
}

boolean ShapesAreSet(int shape1, int shape2, int shape3)
{
    if(shape1 == shape2 && shape1 == shape3) return true; //Allemaal dezelfde vorm
    if(shape1 != shape2 && shape1 != shape3 && shape2 != shape3) return true; //Allemaal andere vorm
    return false;
}

boolean NumbersAreSet(int number1, int number2, int number3)
{
    if(number1 == number2 && number1 == number3) return true; //Allemaal dezelfde aantal
    if(number1 != number2 && number1 != number3 && number2 != number3) return true; //Allemaal andere aantal
    return false;
}
