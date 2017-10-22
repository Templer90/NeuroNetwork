Brain brain;

void setup(){
  size(640,480);
  
  brain=new Brain(2,10);

}



void draw(){
  background(0);
  brain.draw();
}