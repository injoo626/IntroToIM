PFont f;

TextRect myText1;
TextRect myText2;
TextRect myText3;
TextRect myText4;
TextRect myText5;
TextRect myText6;

StripePatch myPatch1;
StripePatch myPatch2;

void setup(){
  size(500,800);
  background(255,255,255);
  f=createFont("Arial",16);
  myText1= new TextRect(1,1,16,26,72,179,50,50,100,300);
  myText2= new TextRect(2, 7, 8, 179,26,26,100, 200,350,200);
  myText3= new TextRect(1, 5, 25,24,146,53,80,500,400,80);
  myText4= new TextRect(2, 3, 20, 242, 227, 20, 300, 320, 60, 450);
  myText5= new TextRect(1, 5, 50, 205, 20, 242, 50, 650, 400, 140);
  myText6= new TextRect(2, 2, 10, 242, 153, 20, 250, 80, 200, 70);
  myPatch1= new StripePatch(2,300,100,100,200,10,1,40);
  myPatch2= new StripePatch(2,250,500,130,180,8,2,80);
}



class TextRect{
  int  fS,d,s;
  float cR, cG, cB, X, Y, sX, sY;
  TextRect(int dir, int speed, int fSize, float colorR, float colorG, float colorB,  float iX,  float iY,  float sizeX, float sizeY){
    d= dir;
    s=speed;
    fS= fSize;
    cR= colorR;
    cG= colorG;
    cB= colorB;
    X= iX;
    Y= iY;
    sX= sizeX;
    sY= sizeY;
  }
  
  
  void textDirection(){
    if (d==1){
      X+=s;
      if (X>=width){
        s= -s;
      }
      if(X<0) {s= -s;}
    }
    if (d==2){
        Y+=s;
      if (Y>=height){
        s= -s;
      }
      if (Y<0){s=-s;}
    }
  }
  
  
  void textDraw(){
    for (float textX=X; textX<(X+sX); textX+=(fS*3)){
      for(float textY=Y;textY<(Y+sY);textY+=fS){
        textFont(f,fS);
        fill(cR,cG,cB);
        text("What?",textX,textY);
      }  
    }
  }
  //void textMove(){
  //  background(0);
  //  TextRect.textDirection();
  //  TextRect.textDraw();
  //}
}

class StripePatch{
  float sW, Xi,Yi, sX, sY, density,angle;
  int dir;
  StripePatch(float strokeWeight,float strXinitial, float strYinitial, float strpatSizeX,float strpatSizeY, float strDensity, int strDir, float strAngle){
    sW= strokeWeight;
    Xi= strXinitial;
    Yi= strYinitial;
    sX=strpatSizeX;
    sY=strpatSizeY;
    density= strDensity;
    dir= strDir;
    angle=strAngle;
  }
  
  void patchDraw(){
    strokeWeight(sW);
    if (dir==1){
      for (float strX=Xi; strX<(Xi+sX);strX+=density){
        line(strX,Yi,strX+angle,Yi+sY);
      }
    }
    if (dir==2){
      for (float strX=Xi+sX;strX>Xi;strX-=density){
        line(strX,Yi,strX-angle,Yi+sY);
      }
    }
  }
}



void draw(){
  background(255,255,255);
  myText1.textDirection();
  myText1.textDraw();
  
  myText2.textDirection();
  myText2.textDraw();
  
  myText3.textDirection();
  myText3.textDraw();
  
  myText4.textDirection();
  myText4.textDraw();
  
  myText5.textDirection();
  myText5.textDraw();
  
  myText6.textDirection();
  myText6.textDraw();
  
  myPatch1.patchDraw();
  myPatch2.patchDraw();
  
  myPatch1.patchDraw();
  myPatch2.patchDraw();
}
