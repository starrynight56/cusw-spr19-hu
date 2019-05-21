ArrayList<Road> Roads = new ArrayList<Road>();
//generate a  path that takes takes up more or less one block of space. 
class Road{
  
  //looks at the next empty space to see if there is something in its spot
  /* 1 = straight vert
  *  2 = left
  *  3 = right
  *  4 = straight hor 
  *  0 = nothing becuase there is no way to go 
  */
  int next;
  PVector Loc; 
  int roadWidth;
  int roadLength; 
  
  Road(int cellSize, PVector Location, int n){
    next = n;
    roadWidth = cellSize/(7/2);
    roadLength = cellSize;
    Loc = Location;
  }
  
  void draw(){
    pushMatrix();
      //a road is just going to be a flat box that is given a certain ratio based on how large the cell Size is 
      translate(Loc.x,0,Loc.z);
      noStroke();
      fill(40);
      if(next == 1){
        box(roadWidth,1,roadLength);
      }else if(next == 2){//left
        pushMatrix();
        translate(0,0,roadLength/5);
        box(roadWidth,1, roadLength*2/3);
        popMatrix();
        pushMatrix();
        translate(roadLength/5,0,0);
        box(roadLength*2/3,1,roadWidth);
        popMatrix();
      }else if(next == 3){
        pushMatrix();
        translate(0,0,roadLength/5);
        box(roadWidth,1, roadLength*2/3);
        popMatrix();
        pushMatrix();
        translate(-roadLength/5,0,0);
        box(roadLength*2/3,1,roadWidth);
        popMatrix();
      }else if(next ==4){
        box(roadLength,1,roadWidth);
      }
   
    popMatrix();
    
  }
  
}

//we only get one road bc it's to hard to do anything else
  void drawRoads(){
    for(int i  = 0; i<Roads.size(); i++){
      Road r = Roads.get(i);
      r.draw();
    }
  }
