class Brain {
  private class Layer {
    Node[]nodes;
    float x=0;
    float y=0;

    public int size=0;

    Layer(int size, float x, float y, color col) {
      this.init(size, x, y, col);
    }
    Layer(int size, float x, float y) {
      this.init(size, x, y, color(255));
    }

    public Node getNode(int i) {
      return this.nodes[i];
    }


    private void init(int size, float x, float y, color col) {
      nodes=new Node[size];
      this.x=x;
      this.y=y;
      this.size=size;

      for (int i=0; i<size; i++) {
        nodes[i]=new Node(this.x, this.y+25*i, col);
      }
    }

    public void draw() {
      for (int i=0; i<nodes.length; i++) {
        nodes[i].draw();
      }
    }
  }

  Layer[] layers;

  Brain(int hiddenLayers, int output ) {
    float x=20;
    float y=20;
    float offset=50;
    layers = new Layer[hiddenLayers+2];

    layers[0] = new Layer(28*28, x, y, color(0, 255, 0));
    for (int i=1; i<hiddenLayers+1; i++) {
      layers[i] = new Layer(16, x+offset*i, y, color(0, 255, 0));
    }

    layers[hiddenLayers+1] = new Layer(output, x+offset*(hiddenLayers+1), y, color(255, 0, 0));


    for (int i=1; i < hiddenLayers+2; i++) {
      Layer il=layers[i-1];
      Layer l=layers[i];
      for (int j=0; j<l.size; j++) {
        l.getNode(j).inputs = new Edge[il.size];
      }
      for (int j=0; j<il.size; j++) {
        il.getNode(j).outputs = new Edge[l.size];
      }
    }

    Edge e;
    for (int i=1; i < hiddenLayers+2; i++) {
      Layer il=layers[i-1];
      Layer l=layers[i];
      for (int j=0; j<l.size; j++) {//Alle Nodes in Layer
        for (int k=0; k < il.getNode(j).outputs.length; k++) {//Alle Outputs in Layer davor
          e=new Edge(il.getNode(k),l.getNode(j));

          il.getNode(k).outputs[j] = e;
          l.getNode(j).inputs[k] = e;
        }
      }
    }
  }

  public void setInput() {
  }


  public void think() {
  }

  public void draw() {
    //pushMatrix();
    //translate(400,0);

    for (int i=1; i<layers.length; i++) {
      layers[i].draw();
    }

    //popMatrix();
  }
}