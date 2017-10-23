Brain brain;
InputGrid input;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);

  input=new InputGrid(10, 10, 28);
  brain=new Brain(200, 20, input, 2, 10);
}



void draw() {
  background(0);

  brain.draw();
  input.draw();
}