class Perceptron2
{
  float[] weights;
  float lr=0.01;
  public Perceptron2(int n)
  {
    weights = new float[n];
    for(int i=0;i<weights.length;i++)
    {
      weights[i]=random(-1,1);
    }
  }
  int guess(float[] inputs)
  {
    float sum=0;
    for(int i=0;i<inputs.length;i++)
    {
      sum+=inputs[i]*weights[i];
    }
    return sign(sum);
  }
  int sign(float n)
  {
    return (n>=0)?1:-1;
  }
  
  void train(float[] inputs,int target)
  {
    int guess = guess(inputs);
    int error = target - guess;
    for(int i=0;i<weights.length;i++)
    {
      weights[i]+=error*inputs[i]*lr;
    }
  }
  
  
  float guessY(float x)
  {
      float w0 = weights[0];
      float w1 = weights[1];
      float w2 = weights[2];
      return -(w2/w1) - (w0/w1)*x;  
}
}
