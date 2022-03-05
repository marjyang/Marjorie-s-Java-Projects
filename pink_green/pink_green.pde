import processing.video.*;
Capture ourVideo;   

void setup() {
  size(1280, 720);
  frameRate(120);
  ourVideo = new Capture(this, width, height, Capture.list()[0], 30);    
  ourVideo.start();                               
}

void draw() {
  if (ourVideo.available())ourVideo.read();     
  ourVideo.loadPixels();    
  int blurAmount = 1;
  loadPixels();                             
  for (int x=0; x<width;x++){
    for(int y=0; y<height;y++){
      float sumDifference = 0;
      int centerR, centerG, centerB;
        centerR = R;
        centerG = G;
        centerB = B;
      PxPGetPixel(x, y, ourVideo.pixels, ourVideo.width);
        for(int blurX = x-blurAmount; blurX <= x+blurAmount; blurX++) {    //visiting every pixel
          for(int blurY = y-blurAmount; blurY <= y+blurAmount; blurY++) {    //for every pixel, see the 9 pixels around it
            if  (blurX>0 && blurX<width && blurY>0 && blurY <height){
              PxPGetPixel(blurX, blurY, ourVideo.pixels, ourVideo.width);
              float difference = dist(centerR, centerG, centerB, R, G,B);    //see how far these pixels are
              sumDifference += difference;
            }
          }
        }
    float mousePos = map(mouseX, 0, width, 50, 150);
      if (sumDifference>mousePos){
        PxPSetPixel(x,y,56,67,43,255,pixels,width); 
      }else{
        PxPSetPixel(x,y,247,229,232,255,pixels,width);
      }
    }
  }
  
  for (int i = max(mouseX-200, blurAmount); i<min(mouseX+200, width-blurAmount); i++) {    
    for (int j = max(mouseY-200, blurAmount); j<min(mouseY+200, height-blurAmount); j++) { 
      float sumDifference = 0;
      int centerR, centerG, centerB;
        centerR = R;
        centerG = G;
        centerB = B;
      PxPGetPixel(i, j, ourVideo.pixels, ourVideo.width);
        if (dist(mouseX, mouseY, i, j) < 200) {                      
          for (int blurX=i- blurAmount; blurX<=i+ blurAmount; blurX++) {     // visit every pixel in the neighborhood
            for (int blurY=j- blurAmount; blurY<=j+ blurAmount; blurY++) {
              if  (blurX>0 && blurX<width && blurY>0 && blurY <height){
                PxPGetPixel(blurX, blurY, ourVideo.pixels, ourVideo.width);
                float difference = dist(centerR, centerG, centerB, R, G, B);    //see how far these pixels are
                sumDifference += difference;
              }
            }
          }
          float mousePos = map(mouseX, 0, width, 50, 150);
          if (sumDifference>mousePos){
            PxPSetPixel(i,j,247,229,232,255,pixels,width);
          }else{
            PxPSetPixel(i,j,56,67,43,255,pixels,width); 
        }
      }
    }  
  }
  updatePixels();   

}


// our function for getting color components , it requires that you have global variables
// R,G,B   (not elegant but the simples way to go, see the example PxP methods in object for 
// a more elegant solution
int R, G, B, A;          // you must have these global varables to use the PxPGetPixel()
void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a =(a << 24);                       
  r = r << 16;                       // We are packing all 4 composents into one int
  g = g << 8;                        // so we need to shift them to their places
  color argb = a | r | g | b;        // binary "or" operation adds them all into one int
  pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
}
