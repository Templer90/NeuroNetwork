class InputGrid extends PositionClass {
  private int size=0;
  private Edge[] grid;

  public InputGrid(float xin, float yin, int size) {
    this.x=xin;
    this.y=yin;
    this.size=size;
    this.grid=new Edge[size*size];
  }

  public void addEdge(int pos, Edge e) {
    this.grid[pos]=e;
  }

  public void draw() {
    pushMatrix();
    float cell=5;
    strokeWeight(1);
    stroke(255);
    noFill();

    rect(this.x, this.y, cell*this.size, cell*this.size );

    for (int x=0; x<this.size; x++) {
      for (int y=0; y<this.size; y++) {
        fill(this.grid[x+y*this.size].value*255);
        stroke(128);
        rect(this.x+x*cell, this.y+y*cell, cell, cell);
      }
    }

    if (overRect(this.x, this.y, cell*this.size, cell*this.size)&&mousePressed) {
      int xpos=(int)((mouseX-this.x)/cell);
      int ypos=(int)((mouseY-this.y)/cell);

      this.grid[xpos+ypos*this.size].value+=0.5;
    }

    popMatrix();
  }

  public void setPicure(MNIST data) {
  }

  public void update() {
    for (int x=0; x<this.size; x++) {
      for (int y=0; y<this.size; y++) {
        this.grid[x+y*this.size].value=1;
      }
    }
  }


  boolean overRect(float x, float y, float width, float height) {
    if (mouseX >= x && mouseX < x+width && 
      mouseY >= y && mouseY < y+height) {
      return true;
    } else {
      return false;
    }
  }
}