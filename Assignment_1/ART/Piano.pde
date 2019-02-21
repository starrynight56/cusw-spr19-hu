//random piano floating across screen 

class Piano{
  PImage img;
  PVector screenLocation;
  Piano(PImage _img){
    img = _img;
    //starting location of piano
    screenLocation = new PVector(img.width,height/2);//width& height auto
  }
  void drawPiano(){
    image(img, screenLocation.x,screenLocation.y);
  }
  //piano moves faster across screen the more elmos are gone
  void update(int speed){
    //default moves 5 pixels per frame??
    screenLocation.x+=(speed >0)?speed*2 : 2;
    System.out.println(screenLocation.x);
  }
  
  
}
