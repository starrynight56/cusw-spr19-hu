MercatorMap map;

Raster raster;

void setup(){
  CensusPolygons = new ArrayList<Polygon>();
  size(800, 600);
  //Intiailize your data structures early in setup 
  map = new MercatorMap(width, height, 30.3, 29.45, -96, -94.9, 0);
  loadData();
  parseData();
  raster = new Raster(20, 600, 600);
}

void draw(){
  background(0);
  for(int i = 0; i<CensusPolygons.size(); i++){
    CensusPolygons.get(i).draw();
  }
  //raster.draw();
  //drawing the county
  county.draw();
  drawInfo();
}
