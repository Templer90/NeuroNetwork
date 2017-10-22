class Brain {
  private class Layer {
    Node[]nodes;
    float x=0;
    float y=0;

    Layer(int size, float x, float y) {
      nodes=new Node[size];
      for (int i=1; i<size; i++) {
        nodes[i]=new Node(x, y+20*i);
      }
    }

    public void draw() {
      for (int i=1; i<nodes.length; i++) {
        nodes[i].draw();
      }
    }
  }

  Layer[] layers;

  Brain(int hiddenLayers, int output ) {
    float x=20;
    float y=10;
    float offset=50;
    layers = new Layer[hiddenLayers+2];

    layers[0] = new Layer(28*28, x, y);
    for (int i=1; i<hiddenLayers+1; i++) {
      layers[i] = new Layer(16, x+offset*i, y);
    }

    layers[hiddenLayers+1] = new Layer(10, x+offset*(hiddenLayers+1), y);
  }

  public void setInput() {
  }


  public void think() {
  }

  public void draw() {
    pushMatrix();
    translate(400,0);

    for (int i=1; i<layers.length; i++) {
      layers[i].draw();
    }

    popMatrix();
  }
}