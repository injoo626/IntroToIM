## Concept
User can control the horizontal location of a circle with a potentiometer. 

![](schematicphoto.jpg)
![](circuitphoto.jpg)


https://user-images.githubusercontent.com/57341200/142370685-0a959aaa-02e7-46dd-aee9-c52480bcdeed.mp4



## Process
I carefully read the example we have covered in the recorded lecture and modified the code a little bit. 


## Reflection 
- How do I keep the buttonState at HIGH? 
  To stop the sound once button is pressed, I first tried creating buttonPressed boolean value. 
  buttonPressed is false initially, but once button is pressed (buttonState turns HIGH) it turns to true.
  I then created if function that stops playing once buttonPressed true but it didn't work.
  I had to use exit() function to break out of the loop. Is there an another way around this?
  
- The sound from the buzzer does change according to the value from the potentiometer. 
  But when the pitch is low, the sound seems to tremble a little. I'm not sure why this happens


