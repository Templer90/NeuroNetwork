class Edge{
  public Node input;
  public Node output;
  
  public float value=0;
  public float bias=1;
  
  Edge(Node in, Node out){
    this.input=in;
    this.output=out;
  }
  
  public void draw(){
    stroke(255,0,0);
    line(input.x,input.y, output.x,output.y);
  }
}