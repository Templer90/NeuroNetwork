class Layer { //<>//
  Node[]nodes;
  float x=0;
  float y=0;

  public int size=0;

  Layer(int size, float x, float y, color col ) {
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

  public void step() {
    for (int i=0; i<nodes.length; i++) {
      nodes[i].step();
    }
  }
}

class OutputLayer extends Layer {

  OutputLayer(int size, float x, float y ) {
    super(size, x, y);
    this.init(size, x, y, color(255));
  }


  private void init(int size, float x, float y, color col) {
    nodes=new Node[size];
    this.x=x;
    this.y=y;
    this.size=size;

    for (int i=0; i<size; i++) {
      nodes[i]=new OutputNode(this.x, this.y+25*i, i+"");
    }
  }
}