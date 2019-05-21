//People stoping and going 
ArrayList<Person> people = new ArrayList<Person>();

class Person{
  int num;
  PVector location; 
  //dimensions of the person based on given height
  int h;int r;int w; 
  Person(PVector loc, int _num, int height){
    num = _num;
    h = height;
    w = h/4;
    r = h/4; 
    location = loc;
  }
  void draw(){
    pushMatrix();
      translate(location.x, 0, location.z);
      pushMatrix();
      fill(230);
      //TODO CHANGE LATER
        translate(location.x , location.y-h/2, location.z);
        box(w, h, w);
        fill(255);
        translate(location.x, location.y-h/2, location.z);
        sphere(r);
      popMatrix();
    popMatrix();
  }
}

void drawPeople(){
  for(int i = 0; i<people.size();i++){
    Person p = people.get(i); 
    p.draw();
  }
}
