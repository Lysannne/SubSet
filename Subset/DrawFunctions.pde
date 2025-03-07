void DrawRectangle(int rectMode, int rectX, int rectY, int rectWidth, int rectHeight, int rectColorHex, int rectRadius)
{
  rectMode(rectMode);
  fill(rectColorHex);
  stroke(rectColorHex);
  rect(rectX, rectY, rectWidth, rectHeight, rectRadius);
}

void DrawQuad(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int quadColorHex)
{
  fill(quadColorHex);
  stroke(quadColorHex);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
