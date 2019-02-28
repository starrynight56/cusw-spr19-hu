//fill color
color poi_fill = color(255,99,71);
color bikeStop = color(255, 255, 0);
color polygon_fill = color(32, 178, 170);
color road_color = color(100,149,237);
  
void drawInfo(){
  fill(0);
  rect(20, 20, 125, 90);
  textSize(16);
  fill(poi_fill);
  text("Bike Stops", 25, 40);
  //atms
  fill(bikeStop);
  text("Bikes", 25, 60);
  //roads
  fill(road_color);
  text("Roads", 25, 80);
  //building structures. 
  fill(polygon_fill);
  text("Buildings", 25, 100);
}
