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

### Journal
- Tried using left,right key to receive user's decision after five rounds
- Realized using keyPressed function in two different settings (when receiving choice and when moving on the next round) makes the program complicated
- Instead decided to use left-right click
  - made program simpler because I've been already tracking different stages of the game (start, instruction, and etc) with mouse click counts.

## 2021.10.09
### Summary
- created instruction image files and displayed
- loaded sound effect and background music 

### Reference
https://www.youtube.com/watch?v=sJfgTH39OCA&list=PLqi51aibKx1nMNq2p5AERwkrHc4-hbucj     suspense background music

https://www.youtube.com/watch?v=h6_8SlZZwvQ           mouse click sound effect

https://www.youtube.com/watch?v=sW8TKZtoND8            key pressed sound effect


## 2021.10.11
### Summary
- file midterm 3
- instead of clicking anywhere on the screen, try generating a button (referred to the doorbell example)

### Journal
- Created Button class and generated two Button objects (left, right)
- Tried to make the buttons change colors when mouse is put above them, but for some reason it's not working
- Maybe the problem is where I put the button display function
  - my intuition for now is that the color does change but it's overwritten by the circle drawn in the next frame

## 2021.10.12
### Summary
- file midterm 3
- put pause on making the buttons change color
- instead tried to create left, right button so that users can read the instruction again if needed.

### Journal
- played a bit with the order of if functions (how to count different stages of the game)
  - initial order  
  if (mousePressed == true){  
    if (stage == 1) {  }  
  }

  - changed order  
  if (stage == 1){  
    if (mousePressed == true){ }  
  }  
  - this did not work
    - cannot restart the game 
    - codes got longer & messier
    - went back to the original algorithm

- tried counting stages automatically and manually
  - automatically: stage number is added whenever mouse is pressed
  - manually: stage number is added manually at the end of each stage
  - manually counting didn't work

- successfully created left,right buttons 
- when somewhere other than the buttons is clicked, nothing happens 
  - first used else function but didn't work  
  - used if function with ! (logical not) which worked 

- FOUND A VERY ANNOYING GLITCH/BUG
  - when BACK button is clicked on stage 3, it suddenly goes back to the start page
  - struggle: it happens only once in a while 
  - tried ordering program differently, changing variables, println and so on, but couldn't find the problem (because it just happens randomly)
  - may be my computer's problem as it stopped happening when I closed all other processing windows

### Reference
https://processing.org/reference/logicalNOT.html           ! (logical not )


## 2021.10.13
### Summary
- final check, commenting, cleaning up (both versions)
- Fixed the bug from yesterday by recognizing BACK, NEXT button within void mouseClicked() 
- encountered a new bug.... : program randomly does or doesn't execute functions at stage 5 (explained in the pde file)

### Journal
- NEW GLITCH
  - when the players click LEFT or RIGHT mouse button at stage 5, the program sometimes does not move on to the next game
  - seems to happen randomly: checked variables and inputs of each step but still could not figure out the problem
  - spent multiple hours looking at this but.... 

- created two versions: one with bug but more complicated, and one without bug but less complicated
  - Final(with bug)
    - gives players options to move back and forth between the instructions
  - Final (without bug)
    - players cannot go back to reread the instruction. only moving forward is possible
- two versions use different background images



