import processing.video.*;
Capture video;

void setup(){
  size(960,540);
  video = new Capture(this, width, height, "FaceTime HD Camera (Built-in)", 30);
  video.start();
}

void captureEvent(Capture video){
  video.read();
}

void draw(){
  background(0,0,20);
    for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y+=10){
       color ourColor = video.get(x,y);
       float ourRed = red(ourColor);
       float ourGreen = green(ourColor);
       float ourBlue = blue(ourColor);  
       
       float newR = ourRed*ourGreen/70;
       float newG = ourGreen*ourBlue/70;
       float newB = ourBlue*ourRed/70;
     
    set(x, y, color(newR, newG, newB));
    }
    }
  for (int x = 0; x < width; x+=10){
    for (int y = 0; y < height; y++){
       color ourColor = video.get(x,y);
       float ourRed = red(ourColor);
       float ourGreen = green(ourColor);
       float ourBlue = blue(ourColor);  
       
       float newR = 255-ourRed;
       float newG = 255-ourGreen;
       float newB = 255-ourBlue;
     
    set(x, y, color(newR, newG, newB));
    }
  }
}
