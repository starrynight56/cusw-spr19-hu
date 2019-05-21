ArrayList<Building> buildings;
ArrayList<Building> parkingS;

class Building{
  PShape b;
  ArrayList<PVector> coordinates;
   //Is parking 
  boolean parking = false;

  
  //Empty constructer for the nothings
  Building(){
    coordinates = new ArrayList<PVector>();
  }
  
  
  //Constructor with coordinates
  Building(ArrayList<PVector> coords, Boolean park){
    coordinates = coords;
    parking = park;
    makeShape();
    
  }
  
  PVector randomCoord(){
    int index = (int) random(coordinates.size());
    return coordinates.get(index);
  }
  //String to hold the type -- defaults to empty if there is none
  String type;
    
  //Making the shape to draw
  void makeShape(){
    b = createShape();
    b.beginShape();
    b.fill(building_color, opacity);
    if (parking){
    b.fill(parking_color,opacity); 
    }
    b.strokeWeight(.5);
    b.stroke(255);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        b.vertex(screenLocation.x, screenLocation.y);
    }
    b.endShape();
  }

  //Drawing shape
  void draw(){
    shape(b, 0, 0);
  }

}
