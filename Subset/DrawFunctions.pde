void DrawRectangle(int rectMode, int rectX, int rectY, int rectWidth, int rectHeight, int rectColorHex, int rectRadius)
{
  rectMode(rectMode);
  fill(rectColorHex);
  stroke(rectColorHex);
  rect(rectX, rectY, rectWidth, rectHeight, rectRadius);
}
