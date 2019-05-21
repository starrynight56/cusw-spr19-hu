//fill color

color road_color = color(117, 120, 124);
color building_color = color(252, 238, 194);
color parking_color = color(42, 123, 252); 
color numRichard_color = color(244, 170, 66);
color numCar_color = color(70, 255, 53);
int opacity = 170;
int road_opacity = 100;

void drawInfo(){
  fill(0);
  strokeWeight(4);
  rect(20, 20, 230, 130);
  textSize(16);
  fill(road_color);
  text("Roads", 25, 40);
  fill(building_color);
  text("buildings",25, 60);
  fill(parking_color);
  text("Parking", 25, 80);
  fill(numRichard_color);
  text("Number of Pedestrians :" + Richards.size() , 25, 100);
  if(y_cars){
  fill(numCar_color);
  text("Number of Cars :" + RichardsCars.size() , 25, 120);
  }else{
    fill(numCar_color);
  text("Number of Cars :" + 0 , 25, 120);
  }
  textSize(14);
  fill(0);
  rect(650,10, 220,60);
  fill(255);
  text("Press any Key to see what \n it would be like with no Cars", 655, 25);
}
