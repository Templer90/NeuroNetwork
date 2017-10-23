class InputGrid {
  public float x=0;
  public float y=0;

  private int size=0;

  public InputGrid(float x, float y, int size) {
    this.x=x;
    this.y=y;
    this.size=size;
  }

  public void draw() {
    pushMatrix();
    float cell=5;
    strokeWeight(1);
    noFill();
    rect(this.x, this.y, cell*this.size, cell*this.size );

    popMatrix();
  }


  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}