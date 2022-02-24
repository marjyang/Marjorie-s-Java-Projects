int time;
int wait = 1000;

void setup(){
  size(900,700);
  time = millis();
}

void draw(){
  //blues - midtones
  for (int i=0; i<1000 ; i++) {   //loops
    float x = random(0, width);
    float y = random(0, height);
    float blues = random(210,242);
    float greens = random(88,195);
    float reds = random(30,76);
    fill(reds, greens, blues);
    noStroke();
    ellipse(x,y, 15, 10);
  }
  //pale yellows - highlights
  for (int i=0; i<10 ; i++){
    float x = random(0, width);
    float y = random(0, height);
    float blues = random(193,255);
    float greens = random(245,255);
    float reds = random(255,255);
    fill(reds, greens, blues);
    noStroke();
    ellipse(x,y,30,10);
  }
  //darker blues - shadows
  for (int i=0; i<1 ; i++){
    float x = random(0, width);
    float y = random(0, height);
    float blues = random(230,230);
    float greens = random(19,139);
    float reds = random(19,40);
    fill(reds, greens, blues,60);
    noStroke();
    ellipse(x,y,250,150);
  }
}

void mouseDragged(){
  //dispersed2
  for (int i=0; i<2 ; i++){
    float x = random(mouseX-200, mouseX+200);
    float y = random (mouseY-200, mouseY+200);
    float blues = random(220,240);
    float greens = random(120,205);
    float reds = random(80,140);
    fill(reds, greens, blues);
    ellipse(x,y,30,30);
  }
  //dispersed1
  for (int i=0; i<4 ; i++){
    float x = random(mouseX-100, mouseX+100);
    float y = random (mouseY-100, mouseY+100);
    float blues = random(249,255);
    float greens = random(150,252);
    float reds = random(115,193);
    fill(reds, greens, blues);
    ellipse(x,y,15,15);
  }
  //impact
  for (int i=0; i<40 ; i++){
    float x = random(mouseX-7, mouseX+7);
    float y = random (mouseY-7, mouseY+7);
    float blues = random(193,255);
    float greens = random(245,255);
    float reds = random(255,255);
    fill(reds, greens, blues);
    ellipse(x,y,10,10);
  }
}

void mousePressed(){
  
  int i=1;
  do{
    float blues = random(193,255);
    float greens = random(245,255);
    float reds = random(255,255);
    stroke(reds, greens, blues);
    noFill();
    strokeWeight(20);
    
    if(millis() - time >= wait){
      ellipse(mouseX, mouseY, 30, 20);
    }
    if(millis() - time>= wait*2){
      ellipse(mouseX, mouseY, 300, 150);
    }
    if(millis() - time>= wait*4){
      ellipse(mouseX, mouseY, 750, 300);
    }
    if(millis() - time>= wait*6.5){
      ellipse(mouseX, mouseY, 1500, 500);
    }
    if(millis() - time>= wait*10){
      ellipse(mouseX, mouseY, 2800, 800);
    }
      i++;
  }while(i<=100);

}
