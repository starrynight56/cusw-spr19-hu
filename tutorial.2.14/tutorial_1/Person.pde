// THe person class will define people in out class

class Person{
  String name;
  String year;
  PVector screenLocation; //special processing type defs a vector
  
  Person(String _name, String _year){
    name = _name;
    year = _year;
    screenLocation = new PVector(width/2,height/2);//width& height auto return values of coordinates
  }
  void randomLocation(){
    screenLocation = new PVector(random(width), random(height));
  }
  void drawPerson(){
    noStroke();// No Circle outline
    fill(255); //fill white 
    ellipse(screenLocation.x, screenLocation.y,30,30);
    text(name+ "\n" + "Year: "+ year, screenLocation.x+30, screenLocation.y+30);
  }
  
}
