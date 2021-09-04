size(1000,1000);

fill(240,206,177);
//ears
ellipse(250,500,100,150);
ellipse(250,500,70,105);
ellipse(750,500,100,150);
ellipse(750,500,70,105);

//face
ellipse(500,500,500,600);

//hair
fill(0,0,0);
ellipse(500,200,250,250);
arc(500,370,500,350,radians(160),radians(380));
stroke(100,100,100);
arc(500,370,500,350,radians(160),radians(380));

//eyes
fill(244,243,239);
ellipse(370,500,120,45);
ellipse(630,500,120,45);
fill(0,0,0);
circle(370,500,45);
circle(630,500,45);

//eyebrows
arc(370,450,120,30,radians(160),radians(380));
arc(630,450,120,30,radians(160),radians(380));

//nose
noFill();
stroke(0,0,0);
arc(500,600,70,30,radians(20),radians(160));

//mouth
fill(144,0,32);
arc(500,670,200,150,radians(0),radians(180));
