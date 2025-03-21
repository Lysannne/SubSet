boolean MouseOnRect(int rectX, int rectY, int rectWidth, int rectHeight)
{
  return mouseX >= rectX
      && mouseX <= rectX + rectWidth
      && mouseY >= rectY 
      && mouseY <= rectY + rectHeight;
}

void HandleCardClick()
{   
  int cardX, cardY;
  for (int i = 0; i < ShownCards.size(); i++)
  {
    cardX = CardXCoordinates.get(i);
    cardY = CardYCoordinates.get(i);
    
    if (MouseOnRect(cardX, cardY, CARD_WIDTH, CARD_HEIGTH))
    {
      if (SelectedCards.hasValue(ShownCards.get(i)))
      {
        SelectedCards.removeValue(ShownCards.get(i)); //Deselecteer als hij al geselecteerd is
      }
      else
      {
        SelectedCards.append(ShownCards.get(i));      
        
        if(SelectedCards.size() == 3)
        {
          if(CardsAreSet(SelectedCards.get(0), SelectedCards.get(1), SelectedCards.get(2)))
          {
            SetsFound++;
            
            ShownCards.removeValue(SelectedCards.get(0));
            ShownCards.removeValue(SelectedCards.get(1));
            ShownCards.removeValue(SelectedCards.get(2));
            
            TakeCards(3);            
          }
          SelectedCards.clear();         
        }
      }
    } 
  };
  
  DrawCards();
}
