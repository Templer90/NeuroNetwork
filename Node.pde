class Node extends PositionClass implements IRandomBias{
  public Edge[] inputs=new Edge[0];
  public Edge[] outputs=new Edge[0];

  public float bias;
  private float oldbias=0;

  protected color col;
  public float value=0.0;


  public Node(float x, float y, color c) {
    this.x=x;
    this.y=y;
    this.col=c;
    this.bias=1;
  }

  public Node(float x, float y) {
    this.x=x;
    this.y=y;
    this.col=color(255);
    this.bias=1;
  }

  protected float activationFunction(float input) {
    if (input<=0)return 0;
    return input;
  }

  public void step() {
    float sum = bias;
    for (Edge e : inputs) {
      sum += e.getValue();
    }

    this.value=this.activationFunction(sum);

    for (Edge e : outputs) {
      e.setValue(this.value);
    }
  }

  public void draw() {
    float size=20;
    ellipseMode(CENTER);
    strokeWeight(0);
    if (this.overCircle(this.x, this.y, size)) {

      for (int i=0; i<this.inputs.length; i++) {
        this.inputs[i].draw();
      }
      if (this.outputs==null) {
        fill(this.col, map(this.value, 0, 1, 0, 255));
      } else {
        for (int i=0; i<this.outputs.length; i++) {
          if (this.outputs[i]!=null) {
            this.outputs[i].draw();
          }
        }
      }
    } else {
      fill(this.value*255);
    }


    ellipse(this.x, this.y, size, size);
  }

  boolean overCircle(float x, float y, float diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }

  public void randomize(float amount) {
    this.oldbias=this.bias;
    this.bias+=amount;
  }

  public void revert() {
    this.bias=this.oldbias;
  }
}