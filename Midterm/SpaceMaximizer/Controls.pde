float bx;//rotate map in the x direction 
float bz;//roatate vertically 
boolean locked = false;
float xOffset = 0.0; 
float zOffset = 0.0; 
Building pickedB;

void mousePressed() {
  /*if the mouse is pressed any where off screen and the "m" key is pressed 
   allow user to move map
  */
  int id = picker.get(mouseX, mouseY);
  println(id+"\n-----");
  
  if (id >= 0 && id<city.size()) {
    pickedB = (Building) city.get(id);
    toggleSelect(pickedB);
  }
  
  if(keyPressed) { //press at same time. 
    if (key == 'x' || key == 'X') {locked = true;}  
  } else {
    locked = false;
  }
  
  
  xOffset = mouseX-bx; 
  zOffset = mouseY-bz; 
  
}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    bz = mouseY-zOffset; 
  }
}

void mouseReleased() {
  locked = false;
}

void keyPressed(){
  if(pickedB!=null && pickedB.selected){
    moveBuilding(pickedB);
  }
}
