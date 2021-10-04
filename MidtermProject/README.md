2021.10.04

1. Game initiator 
- choose between two game types: same payoff or different payoff
  - same pay off: same payoff matrix for five rounds
  - different pay off: different payoff matrices for five rounds 
- type player names 
  -  if nothing is typed, display "You must type your name"
  -  if the name is too long, display "Choose a shorter name"
  -  if the names are the same, display "Choose a different name from your opponent"
- initial earning = 0

3. Game 
- players make decision in each round
- when BOTH players make decision, display each player's earning for the round
- If any of the players do not make decision for more than 1 minute, display a warning message
- display each player's total earning at top corners

4. Result
- after five rounds, display the result based on the earnings
- players can either choose "play again" or "quit game"
  - play again = restart the same game type with cumulative earning
  - players can choose "play again" up to five times
  - if "play again" is chosen 6 times, display "You need to start a new game!"
  - quit game = back to the game initiating phase, earning becomes 0

 
 
 class Game 
 - game type: same/different payoff matrix
 - player name 
 - game number (if player chose "play again" in the previous game)
 - initial earning (if there are previous games, initial earning would be the total of the previous round)
 
 Game functions
 - ask for player's name
 - player's name checker: check if the players have entered valid name
 - calculate the earning each round and display
 - calculate the total earning and display
 - game stopper: decide the winner, give players options (play again or quit game)

Reference
http://learningprocessing.com/examples/chp18/example-18-01-userinput
 - 

