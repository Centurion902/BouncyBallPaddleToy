int size = 900;
float px = 100;
float py = 500;
float vx = 3;
float vy = 4;
float ax = 0;
float ay = 1;
float d = 50;
float rectx = size/2-50;
float recty = size-20;
float rectv = 10;
float rectxs = 100;
float rectys = 20;

void setup(){
  //cant use vars for some reason here.
  size(900, 900);
}

void draw(){
  background(255);
  ellipse(px, py, d, d);
  rect(rectx, recty, rectxs, rectys);
  fill(0);
  
  px+=vx*0.7;//updates position with air dampning
  py+=vy*0.7;  
  
  wallCollision(); 
  
  rectCollision();
  
  //updates velocity
  vx+=ax;
  vy+=ay;
  
}

void keyPressed(){
  if(key == 'a'){
    rectx-=rectv;
  }
  if(key == 'd'){
    rectx+=rectv;
  }
  
  
}

void rectCollision(){
  //checks above rectangele but not below floor
  if(py+d/2>size-rectys && px >rectx && px < rectx + rectxs && py+d/2<size){
    
    py =(size-d/2-rectys)-1;
    vy*=-1.2; //boost on hitting pad
  }
  
}

void wallCollision(){
  if(px+d/2>size){
    
    px = size-d/2;
    vx*=-1;
  }
  if(px-d/2<0){
    
    px = d/2;
    vx*=-1;
  }
  if(py+d/2>size){
    
    py = size-d/2;
    vy*=-1;
  }
  if(py-d/2<0){
    
    py = d/2;
    vy*=-1;
  }
  
}
  