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
- displayed dilema matrix based on the data
- recognizes what kind of decision is made based on the keys users press

### Journal
I first loaded my files in hardcoding (simply writing down everything) but soon realized it would be better to have an array of matrices
to call different data on differen rounds. I took a while to figure out the answer but I think it was definitely worth it.

When I first tried to get users' decisions based on the keys pressed, I had hard time figuring out how to distinguish decisions made by each player.
Right now, I am counting the number of the times any key is pressed. I'm not sure if this will work as the rounds go on. 

### Reference
https://www.economics.utoronto.ca/osborne/2x3/tutorial/NEFEX.HTM   examples of different nash equilibrium matrices

## 2021.10.07
### Summary
- the game proceeds to the next round when both decisions are made
- after each round, players' cumulative earning is displayed
- after five rounds, players' total earning is displayed and players can either choose to continue or quit playing the game
  - reset the earning to 0
  - start from the current earning
- lots and lots of debugging: actually had some fun! Thinking about each function's order and how they are intertwined with each other were quite interesting

## 2021.10.09
### Summary
- created instruction image files and displayed
- loaded sound effect and background music 

### Reference
https://www.youtube.com/watch?v=sJfgTH39OCA&list=PLqi51aibKx1nMNq2p5AERwkrHc4-hbucj     suspense background music

https://www.youtube.com/watch?v=h6_8SlZZwvQ           mouse click sound effect

https://www.youtube.com/watch?v=sW8TKZtoND8            key pressed sound effect
