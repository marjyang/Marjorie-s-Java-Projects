//textures using parametric equations 
float l;

float x1(float l){        //mapping out each point
  return sin(l/10)*100 + sin(l/5)*mouseX+1;        //amplitude change
}
float y1(float l){
  return cos(l/30)*mouseY+1;        //amplitude change
}
float x2(float l){
  return sin(l/10)*200 + sin(l)*2;
}
float y2(float l){
  return cos(l/20)*200 + cos(l/12)*30;
}

void setup(){
  background(100,110,102);
  size(500,800);
}

void draw(){
  background(100,110,102);

  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  
  int numLines = mouseX*mouseY/700;    //number of lines change with position of mouse
  
  for(int i=0;i<numLines;i++) {
  line(x1(l+i),y1(l+i),x2(l+i),y2(l+i));        //connecting the points to form lines
  }
  l+=.0004*mouseY;        //speed of movement changes with position of moouse
}
