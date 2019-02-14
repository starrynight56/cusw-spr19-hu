//step 1: create //allocate memory for ur person [global]
ArrayList<Person> people;
ArrayList<Connection> frands;//yes
Person Rosanne;

//runs once
void setup(){
  size(800,600);
  initialize();
}
//humans cannot comprehend more than 60fps so fps
void draw(){
  background(0);
  //fill(255);
  ////ellipse(x,y,length, height)
  //ellipse(mouseX,mouseY,50,10+mouseY/100);
  
 //draw rosanne
 Rosanne.drawPerson();
 //draw people!!!!!! :DDDDD
 for(Person p: people){
    p.update();// updates location IF selected
   p.drawPerson();
 }
 //draw connects!!! :DDDDD
 for(Connection c: frands){
   c.draw();
 }
}

void mousePressed(){
  //background(#FF0000,100);
  for(Person p: people){
    //for any given selection check if a person has been selection.
    if(p.checkSelection()){
      break;
    };//ONLU SELECTS WHEN MOUSE IS CLICKED
    
  }
}

void mouseReleased(){
  for (Person p: people){
    p.locked = false;
  }
}

void keyPressed(){
  initialize();
}
//so that we can run the setup many times instead of just upon initialize
void initialize(){
  
  people = new ArrayList<Person>();
  frands = new ArrayList<Connection>();
  //begin node definitions. 
  Rosanne = new Person("Rosanne", "4");
  //fill the arrayList
  for(int i=0; i<10; i++){
    Person p =  new Person("Person" +i, str(int(random(1,5))));
    p.randomLocation();
    people.add(p);
  }
  //background(0);// if u define it here your background will be stagnant
  //background(255);
  
  //who are our frands???
  for(Person origin: people){
    for(Person destination: people) {
      //is person referencing it self!!!
      if(!origin.name.equals(destination.name)){
       ///check if they are same year
        if(origin.year.equals(destination.year)){
           frands.add(new Connection(origin, destination, "frands"));
        }
      }
    }
  }
}
