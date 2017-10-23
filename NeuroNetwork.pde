Brain brain;
InputGrid input;

void setup(){
  size(640,480);
  ellipseMode(CENTER);
  
  brain=new Brain(2,10);
  input=new InputGrid(10,10, 28);
  
}



void draw(){
  background(0);
  
  brain.draw();
  input.draw();
}