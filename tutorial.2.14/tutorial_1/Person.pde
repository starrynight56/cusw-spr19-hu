// THe person class will define people in out class

class Person{
  String name;
  String year;
  PVector screenLocation; //special processing type defs a vector
  boolean locked;
  
  Person(String _name, String _year){
    name = _name;
    year = _year;
    screenLocation = new PVector(width/2,height/2);//width& height auto return values of coordinates
  }
  void randomLocation(){
    screenLocation = new PVector(random(width), random(height));
  }
  
  //see if my mouse is near my person
  boolean hoverEvent(){
    float xDistance = abs(mouseX - screenLocation.x);
    float yDistance = abs(mouseY - screenLocation.y);
    
    if(xDistance<=15 && yDistance<=15){
      return true;
    }else{
      return false;
    }
  }
  //is my person selected by the mouse?
  boolean checkSelection() {
    if(hoverEvent()){
      locked = true;
    }else{
      locked = false;
    }
    return locked;
  }
  //update person location if locked on 
  void update(){
    if(locked){
      screenLocation = new PVector(mouseX, mouseY);
      
    }
  }
  void drawPerson(){
    noStroke();// No Circle outline
    if (hoverEvent()) {
      fill(#FFFF00);
    }else{
      fill(255);
    }
    //fill(255); //fill white 
    ellipse(screenLocation.x, screenLocation.y,30,30);
    text(name+ "\n" + "Year: "+ year, screenLocation.x+30, screenLocation.y+30);
  }
  
}
