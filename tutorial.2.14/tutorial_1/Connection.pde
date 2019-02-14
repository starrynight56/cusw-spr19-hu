//represents the Connection between too people/ DIRECTED connect

class Connection{
  Person origin;
  Person destination; 
  String type;
  
  Connection(Person p1, Person p2, String _type){
    origin = p1;
    destination = p2;
    type = _type;
  }
  
  void draw(){
    float x1 = origin.screenLocation.x;
    float y1 = origin.screenLocation.y;
    float x2 = destination.screenLocation.x;
    float y2 = destination.screenLocation.y;
    
    strokeWeight(5); // 5 pixels wide line
    stroke(255,100); //white but translucent
    
    //make line!!! :DDDD
    line(x1,y1,x2, y2);
    fill(255);//white Text
    text(type, (x1+x2)/2,(y1+y2)/2);
  }
}

//SHort COlor lesson

//fill() -> fill shapes wtih solid colors text
//stroke(color, opacity) -> Color outlines of shapes, and lines
