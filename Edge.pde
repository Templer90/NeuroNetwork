class Edge{
  public Node input;
  public Node output;
  
  public float value=0;
  public float bias=1;
  
  
  public void draw(){
    line(input.x,input.y, output.x,output.y);
  }
}