import tracer.easings.*;
import tracer.*;
import tracer.renders.*;
import tracer.paths.*;

/* 
Computational Urban Science Workshop
Rosanne Hu

A Script that generates a 3d Visual representation of the rice village area
and the car/pedestrian traffic of the area. Allows the user to adjust buildings
in the area to see how the foot traffic is affected

*/

void setup(){
  //generate a larger screen compensate for the user interaction
  size(900, 700, P3D);
  picker = new Picker(this);
  smooth();
  
  initializeCity();
  initializePeople();
  initializeRoads();
}


void draw(){
  background(100);
  camera(bx, bz, (height/2) / tan(PI/6),width/2, height/2, 0,0,1,0);
  translate(width/2, height/2 + 100, 0);
  
  //Draw the buildings
  drawBuildings();
  //println("-----------");
  //Draw the people
  drawPeople();
  drawRoads();
}
