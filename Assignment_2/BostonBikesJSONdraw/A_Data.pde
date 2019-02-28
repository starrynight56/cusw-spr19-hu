JSONObject example;
JSONArray features;
JSONObject bLocations;
JSONObject wholeArea;
JSONArray bikes; 
//Look at https://processing.org/reference/JSONObject.html for more info

void loadData(){
  //Load and resize background image
  background = loadImage("data/background.png");
  background.resize(width, height);
  
  //Small example area
  //example = loadJSONObject("data/example.json");
  //features = example.getJSONArray("features");
  
  bLocations = loadJSONObject("data/bostonbikes.json");
  bikes = bLocations.getJSONArray("bikeData");
  //Whole Area
  wholeArea = loadJSONObject("data/wholeArea.json");
  features = wholeArea.getJSONArray("features");
  
  println("There are : ", features.size(), " features."); 
}

void parseData(){
  //Pare location data of the bike stop locations
  
    for(int i=0; i<bikes.size(); i++){
      //get the lat and lon of each of the bike locations
      Float lat = bikes.getJSONObject(i).getFloat("Latitude");   
      Float lon = bikes.getJSONObject(i).getFloat("Longitude");
       println(lat,lon);
    //Make POIs if it's a point

      if((-71.08110<lat)&&(lat<-71.07112)){
        println("in");
        if((42.34863<lon)&&(lon<42.35327)){
        //create new POI if coordinate is within reach. 
        POI poi = new POI(lat, lon);
        poi.type = "bike Stop";
        pois.add(poi);
        }
      }
      println(pois.size());
    }
    

  //Sort 3 types into our respective classes to draw
  for(int i = 0; i< features.size(); i++){
    //Idenitfy 3 main things; the properties, geometry, and type 
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
   
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
      Polygon poly = new Polygon(coords);
      polygons.add(poly);
    }
    
    //Way if a LineString
    if(type.equals("LineString")){
      ArrayList<PVector> coords = new ArrayList<PVector>();
      //get the coordinates and iterate through them
      JSONArray coordinates = geometry.getJSONArray("coordinates");
      for(int j = 0; j<coordinates.size(); j++){
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);
        //Make a PVector and add it
        PVector coordinate = new PVector(lat, lon);
        coords.add(coordinate);
      }
      //Create the Way with the coordinate PVectors
      Way way = new Way(coords);
      ways.add(way);
    }
    
  }
}
