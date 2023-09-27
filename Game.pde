class Game
{
  /* Game class represents each puzzle level in the whole game. It gets the grid from the driver class GerrmanderGame
  and the cell array from the grid. It sets the cells and parties for districts and finishes when all districts are full
  and the Green Party has more votes than the Orange Party, found by gScore and oScore. When it is finished,
  it sends the boolean gameFinished = true to tell the GerrymanderGame driver class that it is finished.
  */
  Grid grid;
  Cell [][] cells;
  District[] districts;

  float xCoord;
  float yCoord;
  int oScore;
  int gScore;
  boolean gameFinished;
  
  
  Game(Grid g)
  {
    /* The Game constructor takes a grid as a parameter and gets the cells from the grid using .getCells().
    It initializes the districts array to an array of new empty Districts the same length as the grid's rows.
    */
    grid = g;
    cells = grid.getCells();
    districts = new District[cells.length];
    for (int i = 0; i<cells.length; i++){
       districts[i] = new District(cells);
      
    }
    oScore = 0;
    gScore = 0;
    gameFinished = false;
    gameMode = 1;
  }
  
  
  void display()
  {
      // Game is displayed by displaying all of the districts in the game
      for (int i = 0; i<districts.length; i++){
        districts[i].display();
      }
  }
  
  void showOScore(){
    // shows the number of Orange districts
      textSize(40);
      textAlign(CENTER);
      fill(255, 100, 0);
      text(oScore, width/2+30, 100);
  }
  
  void showGScore(){
    // shows the number of green districts
      textSize(40);
      textAlign(CENTER);
      fill(50, 220, 50);
      text(gScore, width/2-30, 100);
  }

  
  void setDistricts(float pmouseX, float pmouseY)
  {
    /* Takes the parameters pmouseX and pmouseY from mousePressed in the driver class. Calls the method
    addCells(pmouseX, pmouseY) for each district in the districts array to set their parties. Can only
    work on one district at a time, so checks to make sure the last district is full before starting a non-full
    district. Once the district is full, it sets the party of the district with .setParty() method.
    */
      for (int i = 0; i<districts.length; i++){
        if ((i > 0) && (districts[i-1].checkFull() == true) && (districts[i].checkFull() == false)){
            districts[i].addCells(pmouseX, pmouseY);
            districts[i-1].setParty();
          } else if ((districts[0].checkFull() == false)){
            districts[0].addCells(pmouseX, pmouseY);
          }
      }
      if ((districts[districts.length-1].checkFull() == true)){
      districts[districts.length-1].setParty();
      }
  }
  
  void setScore(){
    /* First checks to see if the district has already been accounted for. If not, it checks the party of the 
    district. If the party is 1, it increments gScore by 1, and if it is 2, it increments oScore by 1. After it
    checks the party, it sets accounted to true to prevent the score from being counted multiple times. If the
    total number of points from both parties is the same as the number of rows in the grid and the Green Party
    has more points than the Orange Party, it sets game finished to true to end this level.
    */
    for (int i = 0; i<districts.length; i++){
      if (districts[i].getAccounted() == false){
          if(districts[i].getParty() == 1){
          gScore += 1;
          districts[i].setParty(0);
          districts[i].setAccounted(true);
        }else if(districts[i].getParty() == 2){
          oScore += 1;
          districts[i].setParty(0);
          districts[i].setAccounted(true);
        }
      }
    }
      if ((gScore>oScore) && (gScore+oScore == districts.length)){
          districts[districts.length-1].display();
          districts[districts.length-1].display();
          gameFinished = true;
        }
  }
  
  boolean checkFinish(){
    // returns gameFinished
    return gameFinished;
  }
  
  void resetDistricts()
    {
      /* When 'r' is pressed, it sets clears the board by setting the districts in the district array to new
      empty districts. It allows all of the cells to be districted again by setting districted to false. It sets
      the scores of both parties to zero.
      */
      for (int i = 0; i < cells.length; i++)
      {
        for(int j = 0; j < cells[0].length; j++)
        {
          cells[i][j].setDistricted(false);
        }
      }
      for (int i = 0; i<cells.length; i++){
       districts[i] = new District(cells);
      
      }
      oScore = 0;
      gScore = 0;
     
      
    }
    
   
    
}
