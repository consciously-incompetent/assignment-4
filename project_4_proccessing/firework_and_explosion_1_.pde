//making an empy list for the fireworks //<>//
Firework[] fireworks = new Firework[5];
//variable for which rocket to acitvate
int activate = -1;
void setup() {
  //filling the above lists with new objects
  // and creating the size of the background
  size(400, 400);
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Firework(40 + (i*80), height-45);
  }
}



void draw() {
//draw background, grass and moon
  background(35, 15, 65);
  fill(27, 77, 27);
  rect(0, height-20, width, 20);
  fill(171, 180, 67, 175);
  ellipse(50, 40, 30, 30);
  //displaying each firework
  //launching each firework but only if a clicked variable is true
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].display();
    fireworks[i].Launch();
    
    //checking which number key is pressed to see which firework to activate
    if (activate == i) {
      fireworks[i].clicked = true;
    }
//the after a random distance is crossed fireworks explode
//the reason its an OR statment is without it the fireworks would flicker 
//because of the limit change randomly each frame
    if (fireworks[i].location.y <= random(0, 100) || fireworks[i].exploded == true) {
      fireworks[i].exploded();
    }
  }
}


//checks which key is pressed and sends that information the activate variable
//i subtract by 49 so that the 1 key is actually 0 becuase of array counting 
void keyPressed() {
  activate = key - 49;
  //println(activate);
  //the above println was for debuging 
}
