Table CountyBoundary, CensusData,CensusBlocks;

void loadData(){
  CountyBoundary = loadTable("../data/countyOutlineNodes.csv", "header");
  CensusBlocks = loadTable("../data/nodes.csv", "header");
  CensusData = loadTable("../data/attributes.csv", "header");
  println("Data Loaded");
}

void parseData(){
  //First parse county polygon
    ArrayList<PVector> coords = new ArrayList<PVector>();
    for(int i = 0; i<CountyBoundary.getRowCount(); i++){
         float lat = float(CountyBoundary.getString(i, 2));
         float lon = float(CountyBoundary.getString(i, 1));
         coords.add(new PVector(lat, lon));
    }
   county = new Polygon(coords);
   county.outline = true;
   county.makeShape();  
   //WORKING
   
//Now we can parse the population polygons
  int previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<CensusBlocks.getRowCount(); i++){
    int shapeid = int(CensusBlocks.getString(i, 0));
    println(shapeid);
       if(shapeid != previd){//Begin new Shape
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);//begin a new polygon object
               poly.id = shapeid;
               CensusPolygons.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
       }
       if(shapeid == previd){
         float lat = float(CensusBlocks.getString(i, 2));
         float lon = float(CensusBlocks.getString(i, 1));
         println(lat, lon);
         coords.add(new PVector(lat, lon));
       }
  }
  
  //Add attribute you want to your polygon (you can add more attributes if you want and look at the Tiger page for more info) 
  //We want them to be by district
  for(int i = 0; i<CensusPolygons.size(); i++){
    //CensusPolygons.get(i).score = CensusData.getFloat(i, "DP0010001"); //this is ONLY if the IDs are accurate
    CensusPolygons.get(i).colorByScore();
    CensusPolygons.get(i).makeShape();
  }
  //TODO: change color of area based off of how young or old they are
  

  //Test case for point in Polygon
  //println(county.pointInPolygon(new PVector(27.25, -80.85)));
  
  println("Data Parsed");
}
