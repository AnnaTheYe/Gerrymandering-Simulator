/* Instantiates grids, games, Voting object, Announcement object, xCoord, and yCoord. Also creates the static
integers currLevel, difficulty, and gameMode.
*/
Grid [] grids;
Game [] games;

Voting vote;
Announcement announce;

static int currLevel = 1;
static int difficulty = 1;
// game mode 0 is announcement mode, 1 is puzzle game mode, 2 is voting mode, 3 is finished
static int gameMode;


float xCoord;
float yCoord;



void setup()
{
  /* Creates 5 new grids and 5 new games, then initializes them with the static integer difficulty. Also
  initializes Voting object, Announcement object, and gameMode.
  */
  
  size(800,600);
  
  grids = new Grid[5];
  games = new Game[5];
  
  
  for (int i = 0; i < (grids.length); i++){
    grids[i] = new Grid(i,difficulty);
    games[i] = new Game(grids[i]);
  }
  grids[grids.length-1] = new Grid(grids.length-1,2);
  games[grids.length-1] = new Game(grids[grids.length-1]);   
  
  vote = new Voting();
  announce = new Announcement();
  gameMode = 0;
  

}

void draw()
{
  /* First lets the player iterate through the introduction announcements with the instructions. Then, begins the
  actual game. After each puzzle game is completed, the gameMode is set to 2 and voting commences. After voting,
  the game mode is set back to 1, the currLevel increases by 1, the difficulty is set, and the next puzzle begins.
  After puzzle four, another annoucement is called, which lets the player know the difficulty has been set to max.
  After the last puzzle, the final announcement is called and the game ends.
  */
    background(215,250,215);
    fill(255);
    if (gameMode == 0){
      announce.setMessage(0);
      announce.display();
      if (announce.getAnnounced(0) == true){
        announce.setMessage(1);
        announce.display();
        if (announce.getAnnounced(1) == true){
          announce.setMessage(2);
          announce.display();
        }
      }
    }
    if (announce.getAnnounced(2) == true)
      {
      for (int i = 0; i < games.length; i++){
        if ((i == 0) && (games[0].checkFinish() == false)){
            currLevel = 1;
            grids[0].display();
            games[0].display();
            games[0].setScore();
            games[0].showOScore();
            games[0].showGScore();
      }     else if ((i == 0) && (currLevel == (i+1)) && (vote.getAnswered(i) == false)){
              vote.display();
              gameMode = 2;  
              games[i].resetDistricts();        
            
      } else if ((i!=0) && (i < 4) && (games[i-1].checkFinish() == true) && (games[i].checkFinish() == false) && (vote.getAnswered(i-1) == true) && (currLevel == (i+1))){
            grids[i].display();
            games[i].display();
            games[i].setScore();
            games[i].showOScore();
            games[i].showGScore();
      } else if ((i != 0) && (i < 3) && (currLevel == (i+1)) && (games[i].checkFinish() == true) && (vote.getAnswered(i) == false)){
              vote.display();
              gameMode = 2;  
              games[i].resetDistricts();        
            
      } else if ((i == (games.length-1)) && (games[i-1].checkFinish() == true) && (games[i].checkFinish() == false)){
          if ((announce.getAnnounced(3) == false)){
             announce.setMessage(3);
             gameMode = 0;
             announce.setOpacity(255);
             announce.display();
             if (currLevel < (i+1)){
               currLevel++;
             }
           }else if ((announce.getAnnounced(3) == true) && (gameMode == 1) && (games[i].checkFinish() == false)){
              grids[i].display();
              games[i].display();
              games[i].setScore();
              games[i].showOScore();
              games[i].showGScore(); 
              currLevel = 5;
           }  
      } else if ((i == (games.length-1)) && (announce.getAnnounced(3) == true) && games[i].checkFinish() == true){
                 games[i].resetDistricts();
                 announce.setMessage(4);
                 gameMode = 3;
                 announce.setOpacity(255);
                 announce.display();
           }
   }
 }
}


void mousePressed()
{
  // Takes the mouse coordinates when pressed and calls the setDistricts method
    if(mousePressed)
    {
      xCoord = pmouseX;
      yCoord = pmouseY;
    }
 
    
  for (int i = 0; i < games.length; i++){
    if (currLevel == (i+1)){
       games[i].setDistricts(pmouseX,pmouseY);
       games[i].setScore();
    }
  } 
  
}




void keyPressed()
  {
   /* Depending on the game mode and key pressed, calls methods to reset the districts, continue past an
   announcement, or vote "aye" or "nay"
   */
    if(key == 'r')
    {
      if (gameMode ==  1){
        for (int i = 0; i<games.length; i++){
          if (currLevel == (i+1))
          {
          games[i].resetDistricts();
          } 
        }
      }
    }
    
    
    if(key == 'a')
    {
      if (gameMode == 2){
        vote.aye();
        
        for (int i = 0; i<games.length; i++){
          if (currLevel == (i+1))
          {
            grids[i] = new Grid(i,difficulty);
            games[i] = new Game(grids[i]);
          } 
        }
        if (currLevel < 4){
          gameMode = 1;
        } else if (currLevel == 5){
          gameMode = 0;
        }
      }
    }
    
    if(key == 'n')
    {
      if (gameMode == 2){
        vote.nay();
        for (int i = 0; i<games.length; i++){
          if (currLevel == (i+1))
          {
            grids[i] = new Grid(i,difficulty);
            games[i] = new Game(grids[i]);
          } 
        }
        if (currLevel < 4){
          gameMode = 1;
        } else if (currLevel == 5){
          gameMode = 0;
        }
      }
    }
    
    if(key == 'c')
    {
      if (gameMode == 0){
        announce.nextMessage();
        if ((announce.getMsgNr() == 2) || (announce.getMsgNr() == 3)){
          gameMode = 1;
          delay(50);
          announce.setOpacity(0);
        }
      }
    }
    
  }
  
