Brain brain;
InputGrid input;
List<MNIST> datas;
MNIST data;
int c=0;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);



  try {
    MNISTLoadingService ms=new MNISTLoadingService( dataPath("")+"/train-labels", dataPath("")+"/train-images");
    datas=ms.loadDigitImages();
  }
  catch(IOException e) {
    print(e.getMessage());
    datas=new ArrayList<MNIST>(); 
    datas.add(new MNIST(3, new byte[28*28]));
  }

  input=new InputGrid(10, 10, 28);
  brain=new Brain(200, 20, input, 2, 10);


  input.setPicure(datas.get(0));
}



void draw() {
  background(0);
  data=datas.get(c);
  input.setPicure(data);
  for (int i=0; i<1000; i++) {
    brain.think(data.labelArray());
  }

  brain.draw();
  input.draw();

  fill(255);
  float fittness=brain.fittness(data.labelArray());
  text("Fit: "+String.format("%07.3f",fittness), 20, 240);

  c++;
}