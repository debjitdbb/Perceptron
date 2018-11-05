Perceptron2 p;
Point[] points=new Point[1000];
void settings() {
  size(800,800);
}
int trainingIndex=0;
void setup()
{
  p = new Perceptron2(3);
  for(int i=0;i<points.length;i++)
  points[i]=new Point();
  float[] inputs = {-1,0.5};
  int guess = p.guess(inputs);
  println(guess);
}

void draw()
{
  background(255);
  stroke(0);
  //line(0,height,width,0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  float x1 = -1;
  float y1=f(x1);
  float x2 = 1;
  float y2 = f(x2);
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  
  Point p3 = new Point(-1,p.guessY(-1));
  Point p4 = new Point(1,p.guessY(1));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
  
  for(Point pt: points)
  {
    float[] inputs = {pt.x,pt.y, pt.bias};
    int target=pt.label;
    //p.train(inputs,target);
    
    int guess = p.guess(inputs);
    if(guess==target)
    {
      fill(0,255,0);
    }
    else
    {
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.pixelX(),pt.pixelY(),16,16);
  }
  
  Point training = points[trainingIndex];
  float[] inputs = {training.x,training.y,training.bias};
  int target=training.label;
  p.train(inputs,target);
  trainingIndex++;
  if(trainingIndex==points.length)
  {
    trainingIndex=0;
  }
}

void mousePressed()
{
  for(Point pt: points)
  {
    float[] inputs = {pt.x,pt.y};
    int target=pt.label;
    p.train(inputs,target);
  }
}
