//Store the Buildings somewhere and initialize the grid they will be
ArrayList city = new ArrayList(); ArrayList grid = new ArrayList();

//number of cells in the grid is (2*gridSize+1)^2
int gridSize = 2; 
int cellSize = 100;// size of each cell.
int numBuildings = int(.3*(2*gridSize+1)*(2*gridSize+1));

//a nxn representation of our map 
/* -1 means that there is a building 
 *  0 means that there is a road 
 *
 */
int[][] locations = new int[2*gridSize+1][2*gridSize+1]; 
//somehow working even when gridSize = 1
int gMAX = (gridSize-1)*cellSize;// keep them buildings in the grid ya feel
int minDim = 20;
int maxDim = 70;
int totalPop = gridSize*4;
int locParam = 25*gridSize+25;//Space between buildings 

/*generate a city with assumption that certain stores have a fixed
foot traffic and the traffic around the area will change based upon
how the user decides to change it. 
*/

void initializeCity(){
  //x+n, y+n 
  for(int i =0; i<numBuildings ; i++){
    int x = int(random(-gridSize,gridSize+1));
    int z = int(random(-gridSize, gridSize+1));
    while(locations[x+gridSize][z+gridSize] == -1){
      x = int(random(-gridSize,gridSize+1));
      z = int(random(-gridSize, gridSize+1));
    }
    println("("+x+","+z+")\n");    
    locations[x+gridSize][z+gridSize] = -1;  
    city.add(new Building(new PVector(x*cellSize, 0, z*cellSize), random(3, 5), 50, 60,i));
  }
  

  //initializes the initial grid on the map
  for (int x = -gridSize; x <= gridSize; x++) {
    for (int z = -gridSize; z <= gridSize; z++) {
      //grid cells are just buildings with 0 height.
      grid.add(new Building(new PVector(x*cellSize, 0, z*cellSize), 0, cellSize, cellSize, -1));
    }
  }
}
void initializeCars(){
  cars.add(new Car(cellSize,new PVector(-cellSize*gridSize,0,-gridSize*cellSize),true));
}

void initializePeople(){
  people.add(new Person(new PVector(0,0,0),0, 20));
  for(int i=0; i< totalPop;i++){
   people.add(new Person(new PVector(cellSize,0,0),0, 20));
  }
}

void initializeRoads(){ 
    for(int i=-gridSize+1; i<gridSize+1;i++){
      println("adding Road " +i);
      Roads.add(new Road(cellSize,new PVector(-cellSize*gridSize,0, i*cellSize), 1)); 
      Roads.add(new Road(cellSize, new PVector(i*cellSize,0,cellSize*-gridSize),4));
    }
    Roads.add(new Road(cellSize, new PVector(-cellSize*gridSize,0, -cellSize*gridSize),2));
}
