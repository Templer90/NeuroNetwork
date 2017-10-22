class Node{
  public Edge[] inputs;
  public Edge[] outputs;
  
  public float bias;
  private float x=0;
  private float y=0;
  
  public Node(float x,float y){
   this.x=x;
   this.y=y;
  }
  
  private float activationFunction(float input){
    return input;
  }
  
  public void step(){
    float sum = bias;
    for(Edge e: inputs){
      sum += e.value * e.bias;  
    }
    
    float activation=this.activationFunction(sum);
    
    for(Edge e: outputs){
      e.value = activation;  
    }
    
    
  }
  
  public void draw(){
     ellipse(x,y,20,20);
  }
}