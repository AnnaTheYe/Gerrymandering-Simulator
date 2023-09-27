class Voting
{
  // Occurs between game levels to change the difficulty of the game.
  String [] prompts = {"Restrict the documents eligible \n to prove citizenship for voting by \n removing student IDs.",
                      "Make Election Day a national holiday.",
                    "Expand the powers of poll watchers \n and challengers."};
  String message;
  boolean [] votingAnswered;
  
  Voting()
  {
    // Voting no-arg constructor
    votingAnswered = new boolean[] {false, false, false};
  }
  
  void display()
  {
    // Combines the prompt of the current level with the default success message..
       message = "You have successfully maintained a\n majority of the vote through your redistricting!\n" + 
       "Time to legislate!\n\nNEW BILL PROPOSAL: \n" + prompts[currLevel-1] + "\nPress a for \"aye\" and n for \"nay\".";
    
      fill(255);
      stroke(0,0);
      rect(150,100,500,400,5);
    
      textSize(20);
      textAlign(CENTER,CENTER);
      fill(0);
      text(message, width/2, height/2);
    
  }
  
  void aye()
  {
    /* If 'a' is pressed, for the first vote and third vote, it decreases the difficulty. For the second, it 
    increases the difficulty.
    */
     if (currLevel == 2)
    {
      if (difficulty != 2){
        difficulty ++;
      }
    } else if (difficulty != 0){
      difficulty --;
    }
    votingAnswered[currLevel-1] = true;
    currLevel++;
    gameMode = 1;
  }
  
    void nay()
  {
    /* If 'n' is pressed, for the first vote and third vote, it increases the difficulty. For the second, it 
    decreases the difficulty.
    */
     if (currLevel == 2)
    {
      if (difficulty != 0){
        difficulty --;
      }
    } else if (difficulty != 2){
      difficulty ++;
    }
    votingAnswered[currLevel-1] = true;
    currLevel++;
    gameMode = 1;
  }
  
  boolean getAnswered(int i){
    // checks if this vote has already been answered.
    return votingAnswered[i];
  }
  
  

}
