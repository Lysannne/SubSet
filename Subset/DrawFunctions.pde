void DrawRectangle(int rectMode, int rectX, int rectY, int rectWidth, int rectHeight, int rectColorHex, int strokeColorHex, int rectRadius)
{
  rectMode(rectMode);
  fill(rectColorHex);
  stroke(strokeColorHex);
  rect(rectX, rectY, rectWidth, rectHeight, rectRadius);
}

void DrawQuad(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int quadColorHex)
{
  fill(quadColorHex);
  stroke(quadColorHex);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}

void DrawSwirl(int centerX, int centerY, int swirlWidth, int swirlHeight, int shapeColor) 
{
  float waveHeight = swirlHeight / 2; // Hoe hoog de golf uitslaat (amplitude)
  float waveFrequency = TWO_PI / swirlWidth; // Frequentie zodat de golf binnen de breedte past

  stroke(shapeColor);
  strokeWeight(10);
  beginShape();

  for (int i = 0; i <= swirlWidth; i++) {
    float posX = centerX - swirlWidth / 2 + (i * swirlWidth / swirlWidth);
    float posY = centerY + waveHeight * sin(i * waveFrequency);
    curveVertex(posX, posY);
  }

  endShape();
}
