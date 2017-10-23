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
    float cell=5;
    rect(this.x, this.y, cell*this.size, cell*this.size );
  }
}