JSONArray features;
JSONArray roadFeatures;
JSONObject wholeArea;
JSONObject roadJson; 

/*
Data taken from OSM needs more cleaning
working set: 
-> Roads
-> Buildings
*/
void loadData(){
  
  //roads 
  roadJson = loadJSONObject("data/ways.json");
  roadFeatures = roadJson.getJSONArray("features");
  
  //everything else
  wholeArea = loadJSONObject("data/wholeArea.json");
  features  = wholeArea.getJSONArray("features");
  
  
  println("There are : ", roadFeatures.size(), " road Features."); 
  println("There are : ", features.size(), "Features."); 
}

void parseData(){
  
  
  //ROADS 
  for(int i =0;i<roadFeatures.size();i++){
    JSONObject geometry = roadFeatures.getJSONObject(i).getJSONObject("geometry");
      ArrayList<PVector> coords = new ArrayList<PVector>();
      //get the coordinates and iterate through them
      JSONArray coordinates = geometry.getJSONArray("coordinates");
      for(int j = 0; j<coordinates.size(); j++){
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);
        //Make a PVector and add it
        PVector coordinate = new PVector(lat, lon);
        coords.add(coordinate);
 
        //Create the Way with the coordinate PVectors
        Road road = new Road(coords);
        roads.add(road);
      }
  }
  
  //Buildings+ other things
  for(int i=0; i<features.size(); i++){
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
    JSONObject properties =  features.getJSONObject(i).getJSONObject("properties");
    String amenity;
    if(properties.isNull(("amenity"))){ 
      amenity ="";
      }else{ 
        amenity = (String) properties.get("amenity");
      } 
    
 
 
    //Make buildings if it's a point
    //if(type.equals("Point")){
    //  //create new POI
    //  float lat = geometry.getJSONArray("coordinates").getFloat(1);
    //  float lon = geometry.getJSONArray("coordinates").getFloat(0);
    //  Building building = new Building(lat, lon);
    //  building.type = amenity;
    //  if(amenity.equals("parking")) building.parking = true;
    //  buildings.add(building);
    //}
    
    //Polygons if polygon
   if(type.equals("Polygon")){
      ArrayList<PVector> coords = new ArrayList<PVector>();
      //get the coordinates and iterate through them
      JSONArray coordinates = geometry.getJSONArray("coordinates").getJSONArray(0);
      for(int j = 0; j<coordinates.size(); j++){
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);
        //Make a PVector and add it
        PVector coordinate = new PVector(lat, lon);
        coords.add(coordinate);
      }
      //Create the Polygon with the coordinate PVectors
      Building build;
      if(amenity.equals("parking")){
       
       build = new Building(coords,true);
       
      }else{
      build = new Building(coords, false);
      }
      
      if (build.parking) parkingS.add(build);
      buildings.add(build);
    }
    
  }
  int numpark = 0;
  for(int i=0;i<buildings.size();i++){
    if(buildings.get(i).parking ){
      numpark++;
    }
  }
  println("parking structures:"+ numpark);
}
