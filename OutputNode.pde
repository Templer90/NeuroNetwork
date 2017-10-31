class OutputNode extends Node {
  String label="";

  public OutputNode(float x, float y, String label) {
    super( x, y, color(255));
    this.label=label;
    this.bias=1.0;
  }


  public void draw() {
    float size=20;
    ellipseMode(CENTER);
    strokeWeight(0);
    if (this.overCircle(this.x, this.y, size)) {
      for (int i=0; i<this.inputs.length; i++) {
        this.inputs[i].draw();
      }
      
    } 
    
    fill(this.col, map(this.value, 0, 1, 0, 255));
    ellipse(this.x, this.y, size, size);

    fill(255);
    text(this.label, x+20, y);
  }
}