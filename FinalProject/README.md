

# Etch a Sketch! 

![image](https://user-images.githubusercontent.com/57341200/143387936-1fd73705-c620-4745-875e-ebbfc57156a3.png)

Etch a Sketch is a drawing toy that displays lines based on how user rotates two knobs.  
One knob controls horizontal movement and another controls vertical movement.  
When both knobs are controlled together, it draws a diagonal line. Please look at the YouTube link attached at the end.  

For the final project, I would like to make an Etch a Sketch drawing board with Arduino and Processing.  
Processing will display the picture drawn and I will build two physical knobs and color buttons with Arduino.  
A user can 1) choose the color of the pen with color buttons and 2) draw with two potentiometer knobs.  
When one is done with drawing, one can click mouse and reset the board.  

# Circuit Schematic
![](1207/1207circuit.jpg)



# Photos and Videos
![](final/finalPhoto1.jpg)
![](final/finalPhoto2.jpg)
![](final/finalPhoto3.jpg)


https://user-images.githubusercontent.com/57341200/146452869-27a509a8-00ae-4052-9894-19cfa42077e7.mp4



https://user-images.githubusercontent.com/57341200/146452876-5bedb4f5-0389-4101-87f5-178e57445aaa.mp4



# Reflection 
I struggled with drawing lines without break in the beginning. It was because I tried to draw a line by drawing circles.
When I did that, it drew dotted lines instead of straight line. To make sure lines don't break in the middle, I changed to drawing
a straight line between current position and the previous position. 

Interesting thing to note was that depending on how long the delay is after reading positions, smoothness of the line can be changed.
The longer the delay is, the less smooth the line. Maybe I can later develop this as different drawing tools. 

Even until the last minute, I could not fix the "serialEvent() disabled" error. I tried multiple solutions such as changing resistors, but none worked.
Fortunately, the error only happened once in a while and even when it occurs I could easily reset the program and error would disappear again.

I had so much fun building this project. I was so proud to see people enjoying the game during the IM showcase. 
