ArrayList<Road> roads; 

class Road{
  //Coordinates and color vars!!
  ArrayList<PVector> coordinates;
  Road(){}
  
  //Constructor of coordinates
  Road(ArrayList<PVector> coords){
    coordinates =  coords;
  }
  
  //Draw the road
  void draw(){
    strokeWeight(10);
    stroke(road_color, road_opacity);
    
    
    for(int i = 0; i<coordinates.size()-1; i++){
        //iterate through the coordinates and draw lines
        PVector screenStart = map.getScreenLocation(coordinates.get(i));
        PVector screenEnd = map.getScreenLocation(coordinates.get(i+1));
        line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);
    }
  } 
}
