class Announcement //<>// //<>//
{
  // Messages displayed at various points during the game
  String [] messages = {"Welcome to the Senate, Congressman! \n\nYou represent the Green Party, a traditional-minded, \nrural party whose members average 50-60 years of age. \nYou are facing off against the Orange Party,\na progressive, urban party with a young voterbase. \n\nSadly, your party has been losing voters recently, and \nyou are outnumbered by the Orange voters. \nLuckily, you can still win the election! \n\n(press c to continue)",
    "Your job is to redistrict your state. \nGroup together voters into equally sized districts, \neach of which gets one vote. \nIf you control the most districts in your state, you win \nthe election, even though most of the voters didn’t vote for you! \n\nYou will also have the opportunity to make decisions that\ncan alter the number of voters with legislation. Be careful!\nThe legislation you pass can make redistricting harder or easier\nfor you. This will increase or decrease the size and number of\ntotal districts.\n\n(press c to continue)",
    "To create a district, click on each voter cell. Districts must be contiguous, \nso each cell in a district needs to be next to the others.  \nWhen one district is full, you will automatically start making the next one.  \nThe district’s party is determined by the majority of voters inside the district. \nWin the most districts to win the state. You will have five states to redistrict. \n\nIf you make a mistake, you can press r to reset the state. \n\nGood luck, Congressman! Your Party is counting on you! \n\n(press c to start the game)",
    "ATTENTION: The Supreme Court has ruled on a technicality that your redistricting\nis unconstitutional. The Supreme Court has also ruled that restrictive voting policies\nare unconstitutional. Your legislature has been forced to make voting more fair. \nDifficulty has increased.\n\n(press c to continue)",
    "Congratulations!! Your prudent redistricting methods have kept \nthe Green Party in power despite holding a minority of the voters! \nBecause of your maintenance of power, the people you put in charge \nput people that support your party in the Supreme Court. \n\nUnder Rucho v. Common Cause, partisan gerrymandering is no longer justiciable!\nThe Green Party will stay in charge of the nation for many years to come,\neven as its supporters dwindle to nothing."};

  boolean [] announced;

  int msgNr;

  String message;

  int o;

  Announcement()
  {
    // Sets all announced booleans to false, message number to 0, and opacity to 255
    announced = new boolean[] {false, false, false, false, false};
    msgNr = 0;
    o = 255;
  }

  void display()
  {
    // Displays announcement at the center of the screen
    fill(255, 255, 255, o);
    stroke(0, 0);
    rect(50, 50, 700, 500, 5);

    textSize(18);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0, o);
    text(message, width/2, height/2);
  }

  void setMessage(int m)
  {
    // Sets the current message to the parameter m
    msgNr = m;
    for (int i = 0; i < messages.length; i++)
    {
      if (i == msgNr) {
        message = messages[msgNr];
      }
    }
  }

  void nextMessage()
  {
    // When 'c' is pressed, this method is called to set the announced for this message to true
    announced[msgNr] = true;
  }

  boolean getAnnounced(int i) {
    return announced[i];
  }

  int getMsgNr() {
    // return the current message number
    return msgNr;
  }

  void setOpacity(int opacity) {
    o = opacity;
  }
}
