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
    int max=Math.max(this.grid.length*4, data.data.length);
    byte[]buffer=data.data;
    int n=0;
    for (int i=0; i<this.grid.length; i++) {
      //this.grid[i].value=(float)((int)data.data[i]*255);
      if (n<data.data.length) {
        //this.grid[i].value=Float.intBitsToFloat( buffer[n] ^ buffer[n+1]<<8 ^ buffer[n+2]<<16 ^ buffer[n+3]<<24);
        this.grid[i].value=(buffer[i]<0?buffer[i]+255:buffer[i])/255.0;
      }
    }
    //exit();
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