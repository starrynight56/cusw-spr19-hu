ArrayList<Car> cars = new ArrayList<Car>();

class Car{
  int size;
  PVector loc;
  boolean o;
  Car(int cellSize, PVector _Location,boolean _orientation){
    size = cellSize/(7/4);;
    loc = _Location;
    o = _orientation;
  }
  
  void draw(){
    pushMatrix();
    translate(loc.x,0,loc.z);
    stroke(40);
    fill(255);
    if(o){
      pushMatrix();
      box(size/2,size/4,size);
      translate(0,size/8,0);
      box(size/2,size/4,size/2);
      popMatrix();
    }else{
      pushMatrix();
      box(size,size/4,size/2);
      translate(0,size/8,0);
      box(size/2,size/4,size/2);
      popMatrix();
    }
      
    popMatrix();
  }
  
  void changeOrientation(){
    o = !o;
  }
}

void drawCars(){
  for(int i = 0; i<cars.size();i++){
    Car c = cars.get(i); 
    println("printing person at " + c.loc);
    c.draw();
  }
}
