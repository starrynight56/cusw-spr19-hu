//I think I want elmo's somewhere for some reason

class Elmo{
  PVector screenLocation;
  PImage img;
  float scalar;
  
  //begin defining elmo
  Elmo(PImage _img){
    screenLocation = new PVector(width/2,height/2);//width& height auto
    img = _img;
    scalar = random(0.5,2);
  }
  
  //give the elmo a random location 
  void randomLocation(){
    screenLocation = new PVector(random(50,width-50), random(50,height-50));
  }
  
  void drawElmo(){

    //scalar*img.width, scalar*img.height);
    image(img, screenLocation.x,screenLocation.y,scalar*img.width,scalar*img.height);
  }
  
  // check is the mouse is within bounds of the photo 
  boolean hoverEvent(){
    float xDistance = abs(mouseX - screenLocation.x);
    float yDistance = abs(mouseY - screenLocation.y);
    //Easier for me to assume a default box
    if(xDistance<=scalar*img.width/2 && yDistance<=scalar*img.height/2){
      return true;
    }else{
      return false;
    }
  }
  
}
