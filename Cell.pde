class Cell
{
  // Class for every individual voter cell
  float x;
  float y;
  float w;
  float h;
  int p;
  boolean d;
  
  
  Cell()
  {
    // no-arg constructor for empty cell, all values are set to 0
  x = 0;
  y = 0;
  w = 0;
  h = 0;
  p = 0;
  d = false;
  }
  
  
  Cell(float tempX, float tempY, int party, boolean districted)
  {
    // Cell constructor with arguments
  x = tempX;
  y = tempY;
  w = 50;
  h = 50;
  p = party;
  d = districted;
  }

  void display()
  {
    if (p == 2) // 2 is orange
      fill(255,100,0);
    if (p == 1) // 1 is green
      fill(50,220,50);
    rect(x-w/2,y-h/2,w,h,5);
  }
  
  int getParty()
  {
    return p;
  }
  
    float left()
  {
    return x-w/2;
  }
  
    float right()
  {
    return x+w/2;
  }
  
    float top()
  {
    return y-w/2;
  }
  
    float bottom()
  {
    return y+w/2;
  }
  

  void setDistricted(boolean districted){
    /* If this cell is part of a district, districted is true. Otherwise, districted is false. Meant to prevent
    cells from being added to multiple districts
    */
    this.d = districted;
  }
  
  
  boolean getDistricted(){
    // returns districted
    return this.d;
  }
  
}
