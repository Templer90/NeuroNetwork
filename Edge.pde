class Edge{
  public PositionClass input;
  public Node output;
  
  public float value=0;
  public float bias=1;
  
  
  Edge(InputGrid grid, Node out){
    this.input=grid;
    this.output=out;
  }
  
  Edge(Node in, Node out){
    this.input=in;
    this.output=out;
  }
  
  public void draw(){
    stroke(255,0,0);
    strokeWeight(1);
    line(input.x,input.y, output.x,output.y);
  }
}