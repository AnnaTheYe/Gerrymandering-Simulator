class Grid
{
  // declaring array of cells
  Cell [][] cells;
  // The 3D integer arrays set the number of rows and columns of the grid as well as the parties of inside cells
  int[][][] easy = {  {  {1, 2, 2},
                       {1, 2, 1},
                        {2, 1, 2} 
                      },
                        
                      {  {2, 2, 1},
                       {1, 2, 2},
                       {2, 1, 1} 
                      },
                        
                     { {1, 2, 1},
                       {2, 2, 1},
                        {2, 1, 2} 
                      },  
                      
                     { {1, 2, 1},
                       {1, 2, 2},
                        {2, 1, 2} 
                      },  
                      
                     { {2, 1, 1},
                       {1, 2, 1},
                        {2, 2, 2} 
                      }  
                  };
  int[][][] medium = {  {  {1, 2, 2, 2, 1},
                       {1, 2, 1, 1, 2},
                        {2, 1, 2, 2, 1} 
                      },
                        
                      {  {2, 2, 1, 1, 1},
                       {2, 1, 2, 1, 2},
                       {1, 2, 1, 2, 2} 
                      },
                        
                     { {2, 1, 2, 1, 2},
                       {1, 2, 1, 2, 1},
                        {2, 1, 2, 1, 2} 
                      }, 
                     { {2, 1, 2, 1, 2},
                       {1, 2, 1, 1, 2},
                        {2, 1, 2, 2, 1} 
                      }, 
                     { {2, 2, 1, 2, 1},
                       {1, 1, 2, 1, 2},
                        {2, 1, 2, 1, 2} 
                      } 
                    };
  int[][][] hard = {  {  {1, 2, 2, 2, 1},
                       {1, 2, 1, 1, 2},
                       {2, 1, 2, 2, 1},
                       {2, 2, 1, 1, 2},
                        {2, 1, 2, 2, 1} 
                      },
                        
                      {  {2, 2, 1, 1, 1},
                       {1, 1, 2, 2, 2},
                       {1, 2, 2, 2, 1},
                       {2, 1, 2, 2, 1},
                       {1, 2, 1, 2, 2} 
                      },
                        
                     { {2, 1, 2, 1, 2},
                       {1, 2, 1, 2, 1},
                       {1, 2, 1, 1, 2},
                       {2, 1, 1, 2, 2},
                        {2, 2, 2, 1, 2} 
                      },  
                    
                      {{1, 2, 2, 2, 1},
                       {1, 2, 1, 2, 1},
                       {1, 1, 2, 2, 1},
                       {2, 2, 1, 1, 2},
                       {2, 1, 2, 2, 2} 
                      },
                        
                     { {2, 2, 1, 1, 2, 1, 2},
                       {1, 2, 1, 2, 2, 2, 1},
                       {2, 1, 2, 1, 2, 1, 1},
                       {1, 2, 2, 2, 1, 2, 2},
                        {2, 1, 2, 2, 2, 1, 2} 
                      }                    
                    };

                        
  Grid(int k, int difficulty)
  {
    /* Int k corresponds to each level of game, which is the first coordinate in the 3D array. Difficulty
    determines which array the cells are taken from and the size of the 2D grids
    */
      if (difficulty == 0){
        cells = new Cell[3][3];
      } else if (difficulty == 1){
        cells = new Cell[3][5];
      } else if (difficulty == 2){
        for (int i = 0; i<hard.length; i++){
          // since hard has one 5x7 array, the number of columns needs to be checked before initializing
          if (i == k){
           cells = new Cell[5][hard[i][0].length];
          }
        }
      }
     
    for (int i = 0; i < cells.length; i++)
    {
      for(int j = 0; j < cells[0].length; j++)
      {
        /* sets the locations to start creating the cells. Offset adds/subtracts from the x and y to keep the
        grid in the center of the screen. Sets c to the integer at the index of the array, then initializes the
        values of the cell array.
        */
        int x = 290 + 55 * j;
        int y = 200 + 55 * i;
        int c = 0;
        int offsetX = 0;
        int offsetY = 0;
        if (difficulty == 0){
          c = easy[k][i][j];
          offsetX = 50;
          offsetY = 50;
        } else if (difficulty == 1){
          c = medium[k][i][j];
          offsetY = 50;
        } else if (difficulty == 2){
          c = hard[k][i][j];
            if (cells[0].length == 7){
              offsetX = -50;
              c = hard[k][i][j];
            }
        }
        
        cells[i][j] = new Cell(x+offsetX,y+offsetY,c, false);
      }
    }
  }
  
  void display()
  {
    //Displayed by creating two rects to separate the cells from the background, then displaying cells over them
    fill(20,20,100);
    stroke(0,0);
    rect(cells[0][0].left()-6,cells[0][0].top()-5,cells[0].length*57,cells.length*57,5);
    
    fill(255);
    stroke(0,0);
    rect(cells[0][0].left()-3,cells[0][0].top()-3,cells[0].length*55,cells.length*55,5);
    
    for (int i = 0; i<cells.length; i++)
    {
      for(int j = 0; j<cells[0].length; j++)
      {
        cells[i][j].display();
      }
    }
  }
  
  Cell[][] getCells()
  {
    // returns cell arrays
    return cells;
  }

}
