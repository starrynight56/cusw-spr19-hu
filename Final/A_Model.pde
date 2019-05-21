// Objects to define our Network
//
ObstacleCourse course;
Graph network;
Pathfinder finder;

//  Object to define and capture a specific origin, destiantion, and path
ArrayList<Path> paths;


void waysNetwork(ArrayList<Road> w) {
  //  An example gridded network of width x height (pixels) and node resolution (pixels)
  //
  int nodeResolution = 10;  // pixels
  int graphWidth = width;   // pixels
  int graphHeight = height; // pixels
  network = new Graph(graphWidth, graphHeight, nodeResolution, w);
  println(network.nodes.size());
}
//  Objects to define agents that navigate our environment

void randomNetwork(float cull) {
  //  An example gridded network of width x height (pixels) and node resolution (pixels)
  //
  int nodeResolution = 10;  // pixels
  int graphWidth = width;   // pixels
  int graphHeight = height; // pixels
  network = new Graph(graphWidth, graphHeight, nodeResolution);
  network.cullRandom(cull); // Randomly eliminates a fraction of the nodes in the network (0.0 - 1.0)
}

 

void randomPaths(int numPaths) {
  /*  An pathfinder object used to derive the shortest path. */
  finder = new Pathfinder(network);
  
  /*  Generate List of Shortest Paths through our network
   *  FORMAT 1: Path(float x, float y, float l, float w) <- defines 2 random points inside a rectangle
   *  FORMAT 2: Path(PVector o, PVector d) <- defined by two specific coordinates
   */
   
  paths = new ArrayList<Path>();
  for (int i=0; i<numPaths; i++) {
    //  An example Origin and Desination between which we want to know the shortest path
    //
    PVector orig = new PVector(random(1.0)*width, random(1.0)*height);
    PVector dest = new PVector(random(1.0)*width, random(1.0)*height);
    Path p = new Path(orig, dest);
    p.solve(finder);
    paths.add(p);
  }
  
}

void poiPaths(int numPaths) {
  /*  An pathfinder object used to derive the shortest path. */
  finder = new Pathfinder(network);
  
  /*  Generate List of Shortest Paths through our network
   *  FORMAT 1: Path(float x, float y, float l, float w) <- defines 2 random points inside a rectangle
   *  FORMAT 2: Path(PVector o, PVector d) <- defined by two specific coordinates
   */
   
  paths = new ArrayList<Path>();
  for (int i=0; i<numPaths; i++) {
    
    // Searches for valid paths only
    boolean notFound = true;
    while(notFound) {
      //  An example Origin and Desination between which we want to know the shortest path
      //
      // Origin is a Parking structure
      int orig_index = int(random(parkingS.size()));
      
      PVector orig = parkingS.get(orig_index).randomCoord();
      orig = map.getScreenLocation(orig);
      
      // Destination is Random Building
      int dest_index = int(random(buildings.size()));
      PVector dest = buildings.get(dest_index).randomCoord();
      dest = map.getScreenLocation(dest);
      
      Path p = new Path(orig, dest);
      p.solve(finder);
      
      if(p.waypoints.size() > 1) {
        notFound = false;
        paths.add(p);
      }
      
    }
    
  }
  
}
//init Agents
void initPopulation(int count) {
  /*  An example population that traverses along various paths
  *  FORMAT: Agent(x, y, radius, speed, path);
  */
  Richards = new ArrayList<Agent>();
  for (int i=0; i<count; i++) {
    int random_index = int(random(paths.size()));
    Path random_path = paths.get(random_index);
    if (random_path.waypoints.size() > 1) {
      int random_waypoint = int(random(random_path.waypoints.size()));
      float random_speed = random(0.8, 1);
      PVector loc = random_path.waypoints.get(random_waypoint);
      Agent person = new Agent(loc.x, loc.y, 5, random_speed, random_path.waypoints);
      Richards.add(person);
    }
  }
}

ArrayList<PVector> personLocations(ArrayList<Agent> people) {
  ArrayList<PVector> l = new ArrayList<PVector>();
  for (Agent a: people) {
    l.add(a.location);
  }
  return l;
}

//init Cars
void initCars(int count) {
  /*  An example population that traverses along various paths
  *  FORMAT: Agent(x, y, radius, speed, path);
  */
  RichardsCars = new ArrayList<Car>();
  for (int i=0; i<count; i++) {
    int random_index = int(random(paths.size()));
    Path random_path = paths.get(random_index);
    if (random_path.waypoints.size() > 1) {
      int random_waypoint = int(random(random_path.waypoints.size()));
      float random_speed = random(1.5, 2);
      PVector loc = random_path.waypoints.get(random_waypoint);
      Car cars = new Car(loc.x, loc.y, 10, random_speed, random_path.waypoints);
      RichardsCars.add(cars);
    }
  }
}

ArrayList<PVector> carLocations(ArrayList<Car> car) {
  ArrayList<PVector> l = new ArrayList<PVector>();
  for (Car a: car) {
    l.add(a.location);
  }
  return l;
}
