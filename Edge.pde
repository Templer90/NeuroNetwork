class Edge {
  public PositionClass input;
  public Node output;

  public float value=0;
  public float bias=1;


  Edge(PositionClass grid, Node out) {
    this.input=grid;
    this.output=out;
  }

  Edge(PositionClass grid, Node out, boolean rand) {
    this.input=grid;
    this.output=out;
    if (rand) {
      this.bias=random(10)-5;
    }
  }

  public float getValue() {

    return this.value*this.bias;
  }



  public void setValue(float v) {
    this.value=v;
  }

  public void draw() {
    if (this.bias>=0) {
      stroke(0, 0, 255);
    } else {
      stroke(255, 0, 0);
    }

    strokeWeight(1);
    line(input.x, input.y, output.x, output.y);
  }
}