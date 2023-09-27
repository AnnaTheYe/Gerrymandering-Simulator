class District
{
  /* The District class contains methods to add cells to districts, detect when a district is full,
  set the score of a district, display the district, etc. Each grid has the same number of districts as there
  are rows in the grid. Each district has the same number of cells as there are columns in the grid.
  */
  Cell [][] cells;
  Cell [][] districtCells;
  Cell [][] neighborCells;
  boolean districtFull;
  int nrCells;
  int [] districtParties;
  float r;
  float g;
  float b;
  float o;
  int party1s;
  int party2s;
  int party;
  boolean accounted;

  
  District(Cell [][] c)
  {
    /* Gets the cell array as initialized in the Game class, which is initialized in the Grid class. Creates two
    empty 2D arrays of cells, districtCells and neighborCells, the same size as the grid cells and sets their 
    values to empty cells. It sets the district's parties and colors to zero, and sets accounted to false so 
    when it is full its values will be counted.
    */
    this.cells = c;
    districtCells = new Cell[cells.length][cells[0].length];
    districtParties = new int[cells[0].length];
    for (int i = 0; i<districtParties.length; i++){
      districtParties[i] = 0;
    }
    neighborCells = new Cell[cells.length][cells[0].length];
    nrCells = 0;
    districtFull = false;
    r = 0;
    g = 0;
    b = 0;
    o = 0;
    party1s = 0;
    party2s = 0;
    party = 0;
    accounted = false;
    for (int i = 0; i < districtCells.length; i++)
    {
      for(int j = 0; j < districtCells[0].length; j++)
      {
        districtCells[i][j] = new Cell();
      }
    }
       for (int i = 0; i < neighborCells.length; i++)
    {
        for(int j = 0; j < neighborCells[0].length; j++)
        {
        neighborCells[i][j] = new Cell();
        }
     }
  }
  
  void addCells(float pmouseX, float pmouseY)
  {
    /* Method for adding cells to the district. Creates a new cell and takes the parameters pmouseX and pmouseY
    to check the position of the mouse when clicked. disitrictCells contains the cells already in the district,
    and neighborCells contains all cells that can be added, which are those adjacent to the district cells but
    not already districted. If the mouse is pressed and the location is within the cell walls and the cell is not 
    already part of the district but is in neighborCells, the cell is added to the district, and the cells adjacent
    to it that are not already in the district are added to neighborCells. If the district is empty, neighborCells
    is not checked.
    */
    Cell thisCell = new Cell();
    boolean firstCell = true;
    for (int i = 0; i < neighborCells.length; i++)
    {
        for(int j = 0; j < neighborCells[0].length; j++)
        {
          if (neighborCells[i][j].getParty() != 0){
          firstCell = false;
          }
        }
     }
    
     
    if (nrCells < cells[0].length){
      if (firstCell == true){
        for (int i = 0; i<cells.length; i++){
          for (int j = 0; j<cells[0].length; j++){
            if ((cells[i][j].getDistricted() == false) && (districtCells[i][j].getParty() == 0) && (pmouseX <= cells[i][j].right()) && (pmouseX >= cells[i][j].left())&& (pmouseY <= cells[i][j].bottom()) && (pmouseY >= cells[i][j].top())){
              thisCell = cells[i][j];
              districtCells[i][j] = thisCell;
              districtParties[nrCells] = thisCell.getParty();
              cells[i][j].setDistricted(true);
              nrCells += 1;
              if ((i != 0) && (neighborCells[i-1][j].getParty() == 0)){
                neighborCells[i-1][j] = cells[i-1][j];
              }
               if ((i != cells.length-1) && (neighborCells[i+1][j].getParty() == 0)){
                neighborCells[i+1][j] = cells[i+1][j];
              }
              if ((j != 0) && (neighborCells[i][j-1].getParty() == 0)){
                neighborCells[i][j-1] = cells[i][j-1];
              }
               if ((j != cells[0].length-1) && (neighborCells[i][j+1].getParty() == 0)){
                neighborCells[i][j+1] = cells[i][j+1];
              }
       
            }
            
          }
        }
      } else {
        for (int i = 0; i<cells.length; i++){
          for (int j = 0; j<cells[0].length; j++){
            if ((cells[i][j].getDistricted() == false) && (neighborCells[i][j].getParty() != 0) && (districtCells[i][j].getParty() == 0) && (pmouseX <= cells[i][j].right()) && (pmouseX >= cells[i][j].left())&& (pmouseY <= cells[i][j].bottom()) && (pmouseY >= cells[i][j].top())){
              thisCell = cells[i][j];
              districtCells[i][j] = thisCell;
              districtParties[nrCells] = thisCell.getParty();
              cells[i][j].setDistricted(true);
              nrCells += 1;
              if ((i != 0) && (neighborCells[i-1][j].getParty() == 0)){
                neighborCells[i-1][j] = cells[i-1][j];
                
              }
               if ((i != cells.length-1) && (neighborCells[i+1][j].getParty() == 0)){
                neighborCells[i+1][j] = cells[i+1][j];
              }
              if ((j != 0) && (neighborCells[i][j-1].getParty() == 0)){
                neighborCells[i][j-1] = cells[i][j-1];
              }
               if ((j != cells[0].length-1) && (neighborCells[i][j+1].getParty() == 0)){
                neighborCells[i][j+1] = cells[i][j+1];
              }
       
            }
            
          }
        }
        
        
      }
      
    }
  }
  
  void display()
  {
    /* displays the district by adding a line outside of a cell wall if there are no cells in the district
    next to that wall. When the district is full, if the party is 1, it colors the lines and inside of the district
    green; if the party is 2, it colors the lines and inside of the party orange.
    */
    for (int i = 0; i<districtCells.length; i++)
    {
      for (int j = 0; j<districtCells[0].length; j++)
      {
        if (districtCells[i][j].getParty() != 0)
        {
            
              if ((j == 0) || (districtCells[i][j-1].getParty() == 0)){
                   fill(r,g,b);
                   rect(districtCells[i][j].left()-2.5,districtCells[i][j].top()-2.5,2.5,55);
              }
               if ((j == districtCells[0].length-1) || (districtCells[i][j+1].getParty() == 0)){
                   fill(r,g,b);
                   rect(districtCells[i][j].right(),districtCells[i][j].top()-2.5,2.5,55);
              }
              if ((i == 0) || (districtCells[i-1][j].getParty() == 0)){
                   fill(r,g,b);
                   rect(districtCells[i][j].left()-2.5,districtCells[i][j].top()-2.5,55,2.5);
              }
               if ((i == districtCells.length-1) || (districtCells[i+1][j].getParty() == 0)){
                   fill(r,g,b);
                   rect(districtCells[i][j].left()-2.5,districtCells[i][j].bottom(),55,2.5);
              }
              
             

           if (party == 1){
               r = 25;
               g = 110;
               b = 25;
               o = 180;
              fill(r*2,g*2,b*2,o);
              rect(districtCells[i][j].left()-2.5,districtCells[i][j].top()-2.5,55,55);
            } else if (party == 2){
              r = 128;
              g = 50;
              b = 0;
              o = 180;
              fill(r*2,g*2,b*2,o);
              rect(districtCells[i][j].left()-2.5,districtCells[i][j].top()-2.5,55,55);
            }
            
        }
      }
    }
  }
  
  boolean checkFull()
  {
    // Checks to see if there are as many cells in the district as the columns of the grid.
    if (nrCells == cells[0].length){
      districtFull = true;
    }
    return districtFull;
  }
  
  void setParty()
  {
    /* Checks the party of each cell as it is added, then increments the corresponding party by 1. When the
    district is full, it checks which party's score is higher, then sets the party of the district to that party.
    */
      for (int i = 0; i<districtParties.length; i++){
        if (districtParties[i] == 1){
          party1s += 1;
        }
        if (districtParties[i] == 2){
          party2s += 1;
        }
      }
      
      if ((districtFull == true) && (party1s > party2s)){
         party = 1;
         r = 25;
         g = 110;
         b = 25;
        
      } else if ((districtFull == true) && (party1s < party2s)){
        party = 2;
        r = 128;
        g = 50;
        b = 0;
      }

  }
  
  void setAccounted(boolean a)
  {
    // Checks if the score of the district has been accounted for in game.
    accounted = a;
  }
  
  boolean getAccounted()
  {
    // Checks if the score of the district has been accounted for in game.
    return accounted;
  }
  
    void setParty(int p)
  {
    // When reset, takes 0 as a parameter and sets the party to 0.
    party = p;
  }
  
  int getParty()
  {
    // Returns the district party
    return party;
  }
  
}
