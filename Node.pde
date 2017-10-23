class Node extends PositionClass {
  public Edge[] inputs=new Edge[0];
  public Edge[] outputs=new Edge[0];

  public float bias;

  private color col;
  private float value=0;


  public Node(float x, float y, color c) {
    this.x=x;
    this.y=y;
    this.col=c;
  }

  public Node(float x, float y) {
    this.x=x;
    this.y=y;
    this.col=color(255);
  }

  private float activationFunction(float input) {
    return input;
  }

  public void step() {
    float sum = bias;
    for (Edge e : inputs) {
      sum += e.value * e.bias;
    }

    this.value=this.activationFunction(sum);

    for (Edge e : outputs) {
      e.value = value;
    }
  }

  public void draw() {
    float size=20;
    ellipseMode(CENTER);
    strokeWeight(0);
    if (this.overCircle(this.x, this.y, size)) {

      for (int i=0; i<this.inputs.length; i++) {
        if (this.inputs[i]!=null) {
          this.inputs[i].draw();
        }
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
}