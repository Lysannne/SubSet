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
    
    if (MouseOnRect(cardX, cardY, CardWidht, CardHeight))
    {
      if (SelectedCards.hasValue(ShownCards.get(i)))
      {
        SelectedCards.removeValue(ShownCards.get(i)); //Deselecteer als hij al geselecteerd is
      }
      else
      {
        SelectedCards.append(ShownCards.get(i));      
      }
    } 
  };
  
  DrawCards();
}
