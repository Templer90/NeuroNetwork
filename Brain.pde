class Brain {
  private Layer[] layers;

  private OutputLayer output;
  private ArrayList<Edge> edge=new ArrayList<Edge>(1024);

  Brain(float x, float y, InputGrid grid, int hiddenLayers, int output ) {
    float offset=50;
    layers = new Layer[hiddenLayers+2];

    layers[0] = new Layer(28*28, x, y, color(0, 255, 0));
    for (int i=1; i<hiddenLayers+1; i++) {
      layers[i] = new Layer(16, x+offset*i, y, color(0, 255, 0));
    }

    this.output=new OutputLayer(output, x+offset*(hiddenLayers+1), y);
    layers[hiddenLayers+1] = this.output;

    for (int i=0; i<layers[0].size; i++) {
      layers[0].getNode(i).inputs=new Edge[1];
    }

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
    //InputLayer
    for (int i=0; i<layers[0].size; i++) {//Alle Nodes in Layer
      e=new Edge(input, layers[0].getNode(i));
      layers[0].getNode(i).inputs[0] = e;
      grid.addEdge(i, e);
    }



    //Alle anderen Layer
    for (int i=1; i < hiddenLayers+2; i++) {
      Layer il=layers[i-1];
      Layer l=layers[i];
      for (int j=0; j<l.size; j++) {//Alle Nodes in Layer
        for (int k=0; k < il.size; k++) {//Alle Outputs in Layer davor
          e=new Edge(il.getNode(k), l.getNode(j), true);

          edge.add(e);
          il.getNode(k).outputs[j] = e;
          l.getNode(j).inputs[k] = e;
        }
      }
    }
  }

  public void setInput() {
  }


  public void think(int[] expected) {
    float oldfittness=this.fittness(expected);
    float type=random(1);

    float oldbias=0;

    float r=random(10)-5;
    Edge e=null;
    Node n=null;

    if (type>0.5) {
      e=edge.get((int)random(edge.size()));
      oldbias=e.bias;
      e.bias=r;
    } else {
      Layer l=layers[(int)random(layers.length)];
      n=l.getNode((int)random(l.size));
      oldbias=n.bias;
      n.bias=r;
    }

    for (int i=0; i<layers.length; i++) {
      layers[i].step();
    }

    float newfittness=this.fittness(expected);
    if (oldfittness<=newfittness) {
      if (type>0.5) {
        e.bias=oldbias;
      } else {
        n.bias=oldbias;
      }
    }
  }

  public float fittness(int[] expected) {
    float sum=0;
    float s=0;
    for (int i=0; i<this.output.size; i++) {
      s=this.output.getNode(i).value-expected[i];
      sum+=s*s;
    }

    return sum;
  }

  public void draw() {
    //pushMatrix();
    //translate(400,0);

    for (int i=0; i<layers.length; i++) {
      //layers[i].step();
      layers[i].draw();
    }

    //popMatrix();
  }
}