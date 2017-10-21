class Node{
  public Edge[] inputs;
  public Edge[] outputs;
  
  public float bias;
  
  public Node(){
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
    
  }
}