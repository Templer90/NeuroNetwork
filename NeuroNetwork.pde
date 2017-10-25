Brain brain;
InputGrid input;
MNIST data;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);

  input=new InputGrid(10, 10, 28);
  data=new MNIST(3, new byte[28*28]);
  input.setPicure(data);

  brain=new Brain(200, 20, input, 2, 10);
}



void draw() {
  background(0);

for(int i=0;i<200;i++){
  
  brain.think(data.labelArray());
}

  brain.draw();
  input.draw();

  fill(255);
  text("Fit: "+brain.fittness(data.labelArray()), 20, 240);
}