//fill color
color ageStart = #39ff14;//neon green
color ageEnd = #FF0000;//red 
color polygon_fill = #ffff00;

  
void drawInfo(){
  fill(0);
  rect(20, 20, 150, 50);// create container
  textSize(10);
  setGradient(25, 30, 100, 15, ageStart, ageEnd);
  fill(0);
  text("Younger  :  Older", 30, 40);
  fill(polygon_fill);
  textSize(16);
  text("County Lines", 25, 60);
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2) {
  noFill();

  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
}
