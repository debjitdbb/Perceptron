
float f(float x) {
  //y = mx + b
  return 0.89 * x - 0.1;
}

class Point
{
  float x;
  float y;
  float bias;
  int label;
  
  Point(float x_, float y_)
  {
    x=x_;
    y=y_;
    bias=1;
  }
  
  Point()
  {
    x = random(-1,1);
    y = random(-1,1);
    bias=1;
    float lineY = f(x);
    
    label = (y>lineY) ? 1 : -1;
  }
  
  float pixelX() {
    return map(x,-1,1,0,width);
  }
  
  float pixelY() {
    return map(y,-1,1,height,0);
  }
  
  void show()
  {
    stroke(0);
    if(label==1)
      fill(255);
    else
      fill(0);
      
    float px = pixelX();
    float py = pixelY();
    ellipse(px,py,32,32);
  }
}
