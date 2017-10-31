class Edge implements IRandomBias {
  private float oldbias=0;
  public PositionClass input;
  public Node output;

  public float value=0;
  public float bias=1.0;


  Edge(PositionClass grid, Node out) {
    this.input=grid;
    this.output=out;
  }

  Edge(PositionClass grid, Node out, boolean rand) {
    this.input=grid;
    this.output=out;
    if (rand) {
      this.bias=random(-5.0,5.0);
      this.oldbias=this.bias;
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
      stroke(0, 0, 255, this.value);
    } else {
      stroke(255, 0, 0, this.value);
    }

    strokeWeight(this.bias>=0?this.bias:-this.bias);
    line(input.x, input.y, output.x, output.y);
  }

  public void randomize(float amount) {
    this.oldbias=this.bias;
    this.bias+=amount;
  }

  public void revert() {
    this.bias=this.oldbias;
  }
}