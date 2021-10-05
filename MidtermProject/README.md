# Progress Journal

## 2021.10.04
### Summary
- wrote down general flow of the game (how it begins and ends)
- initially planned the game to be more complicated (ex. entering player names) but failed hard...!!
- ignored trivial details and started from main structure first 

### Journal
1. Start setup
- initial earning = 0
- game number = 1

3. Game 
- players make decision in each round
- when BOTH players make decision, display each player's earning for the round
- display each player's total earning at top corners

4. Result
- after five rounds, display the result based on the earnings
- players can either choose "play again" or "quit game"
  - play again = restart the same game type with cumulative earning
  - players can choose "play again" up to five times
  - if "play again" is chosen 6 times, display "You need to start a new game!"
  - quit game = back to the game initiating phase, earning becomes 0

 
 
 class Game 
 - game number (if player chose "play again" in the previous game)
 - initial earning (if there are previous games, initial earning would be the total of the previous round)
 
 Game functions
 - calculate the earning each round and display
 - calculate the total earning and display
 - game stopper: decide the winner, give players options (play again or quit game)


### Reference
http://learningprocessing.com/examples/chp18/example-18-01-userinput

Tried to let players type in their name using the link above

## 2021.10.05
### Summary
- created csv files for five different matrices and loaded them to my code
- 
### Journal
1. Matrices
- Matrix1: 
  1,1          1.4,0.2
  0.2,1.4      0.4,0.4
- Matrix2:
  0.5,0.5          0.6,0.1
  0.1,0.6          0.2,0.2
- Matrix3:
  1,1          1.4,0,2
  0.2,1.4      0.4,0.4
- Matrix4:
- Matrix5:
2. dd

### Reference
https://www.economics.utoronto.ca/osborne/2x3/tutorial/NEFEX.HTM   examples of different nash equilibrium matrices
