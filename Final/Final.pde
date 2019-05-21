//mapping foot traffic and how they affect things around them? 

/*
This script allows the user to interact with ways of using space
in a given Json map data

Rosanne 
CUSW 2019
*/

MercatorMap map; 
PImage background;
boolean y_cars = true;
int popCount = 30;

void setup(){
  size(960,650);
  
  //Initalize my datastructures
  map = new MercatorMap(width,height, 29.72017, 29.71472, -95.41951, -95.40954,0);
  background = loadImage("background.png");
  //build classes one by one for now 
  buildings = new ArrayList<Building>();
  parkingS = new ArrayList<Building>();
  roads = new ArrayList<Road>();
  
  //load and parse data
  loadData();
  parseData();
  
   /* Step 1: Initialize Network Using ONLY ONE of these methods */
  //randomNetwork(0.5); // a number between 0.0 and 1.0 specifies how 'porous' the network is
  waysNetwork(roads);
  //randomNetworkMinusBuildings(0.1, buildings); // a number between 0.0 and 1.0 specifies how 'porous' the network is
  
  /* Step 2: Initialize Paths Using ONLY ONE of these methods */
  randomPaths(50);
  //poiPaths(1);
  
  /* Step 3: Initialize Population */
  initPopulation(popCount*paths.size());
  initCars(10*paths.size());
  
  
  
}

void draw(){
  //background image from osm
  background.resize(890,650);
  image(background, 20,0);
  
  fill(0,120);
  tint(255, 126); 
  
  
  //Draw all polygons 
  for(int i = 0; i<buildings.size(); i++){
    buildings.get(i).draw();
  }
  //Draw all the ways (roads, sidewalks, etc)
  for(int i = 0; i<roads.size(); i++){
    roads.get(i).draw();
  }
  
  /*  Update and Display the population of agents
   *  FORMAT: display(color, alpha)
   */
  boolean collisionDetection = true;
  println(Richards.size());
  for (Agent p: Richards) {
    p.update(personLocations(Richards), collisionDetection);
    p.display(#FFFFFF, 255);
  }
  /*  Update and Display the population of agents
   *  FORMAT: display(color, alpha)
   */
   if(y_cars){
    for (Car c: RichardsCars) {
      c.update(carLocations(RichardsCars), collisionDetection);
      c.display(#46ff35, 255);
    }
   }
    drawInfo();
}

void keyPressed() {
  y_cars = !y_cars;
  if(!y_cars){
    initPopulation(60*paths.size());
  }else{
    initPopulation(30*paths.size());
  }
}
