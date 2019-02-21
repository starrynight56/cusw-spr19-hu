//Rosanne's ART :DD
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

ArrayList<Elmo> elmos;
PImage elmoImage;
PImage pianoImage;
int destroyedElmos;
int numElmo;
Piano p;
//Begin code borrowed from how-toSprites
Sprite fire;
float px, py; 

// This will be used for timing
StopWatch sw = new StopWatch();

void setup(){
  //set up canvas
  size(640,360);
  elmoImage = loadImage("Elmo.png");
  pianoImage = loadImage("piano.png");
  
  initialize();
}

void draw(){
  background(0);
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
  //put origin of image at the center
  imageMode(CENTER);
  //draw piano
  p.drawPiano();
  p.update(destroyedElmos);
  //draw elmo
  for(Elmo e: elmos){
    e.drawElmo();
  }
  //draw Sprites
  S4P.drawSprites();
  textSize(16);
  //keep count of Elmos you have destroyed 
  //TODO: KEEP TRACK OF THIS. 
  text("Number of Elmos you have destroyed: " + destroyedElmos +"\n"
   +"Horizontal Position of Piano: " + p.screenLocation.x, 10, 20);
  
}

void mousePressed(){
  fire.setXY(mouseX, mouseY);
  fire.setFrameSequence(0, 24, 0.02, 1);
  for(Elmo e: elmos){
    if(e.hoverEvent()){
      //remove elmo if user clicks on elmo
      elmos.remove(e);
      destroyedElmos++;
      break;
    }
  }
}
  
void keyPressed(){
  initialize();
}

//restart if needed 
void initialize(){
  destroyedElmos = 0;
  elmos = new ArrayList<Elmo>();
  //randomize the number of elmos that appear
  numElmo = int(random(1,6));
  p = new Piano(pianoImage);
  
  System.out.println(numElmo);
  for (int i=0; i<numElmo; i++){
    Elmo e = new Elmo(elmoImage);
    e.randomLocation();//place elmo in random location
    elmos.add(e);
  }
  
  fire = new Sprite(this, "explosion.png", 5, 5, 10);
}
