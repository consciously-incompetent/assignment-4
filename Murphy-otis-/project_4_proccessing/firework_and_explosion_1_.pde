//making an empy list for the fireworks //<>//
Firework[] fireworks = new Firework[5];
//making an emppty variable for the menu 
Menu menu;
//variable for which rocket to acitvate
int activate = -1;

//menu variable
// variables for the Graivty multiplier, velocty multiplirt and spark differential
float g_mult = 1;
float v_mult = 1;
int spark_diff = 0;

//colour variables
//variables for the colour of the sparks produced by the fireworks
//they are variables so the user can change them 
int s_R = 250;
int s_G = 255;
int s_B = 90;
int CI = 20;


boolean secondary = false;

//marks down if the rockets have been made yet or not.
//why? so that they arn't repeatadly made at the start of each draw loop
boolean depleted = false;

//variable toturn the menu on or off
boolean menu_ONOFF = false;

void setup() {
  
  //instructions on how to use the game 
  println("press m for menu and space to apply any changes made and to reset the rocket the rockets ");
  println("press v too increase velocity");
  println("press g too increase gravity");
  println("press s too increase the number of sparks the firework makes");
  println("press i,o or p too increase the R, G and B of the sparks");
  println("press shift any of the above commands to decrease their values isntead");
  println("press ] key to set up a secondary round of explosions");
  
  // and creating the size of the background
  size(400, 400);
  
  //setting up the meny variable 
  menu = new Menu();
}



void draw() {
  //draw background, grass and moon
  background(35, 15, 65);
  fill(27, 77, 27);
  rect(0, height-20, width, 20);
  fill(171, 180, 67, 175);
  ellipse(50, 40, 30, 30);
  
  //displaying each firework
  //launching each firework but only if depleted variable is false
  // this to allow resetting the fireworks 
  if (!depleted) {
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i] = new Firework(40 + (i*80), height-45, g_mult, v_mult);
      depleted = true;
    }
    
  }
  
  //go through each firework and display it also checks if it should launch it
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
// if menu is on display it 
  if (menu_ONOFF) {
    menu.display();
  }
}


//checks which key is pressed and sends that information the activate variable
//i subtract by 49 so that the 1 key is actually 0 becuase of array counting
void keyPressed() {

  activate = key - 49;
  if (key == ' ') {
    depleted = false;
  }

// when m is pressed it inverts whatever is in the menu_ONOFF variable
  if (key == 'm') {
    menu_ONOFF =!menu_ONOFF;
  }
//below are the changes to the variables of the rocket and its spark 
//they all boil down to if x key is press increase Y variable by a certain amount
//also they all have if X(the key and shift held down) decrease Y variable by a certain amount
  if (key == 'g') {
    g_mult += 0.01;
  }

  if (key =='G') {
    g_mult -= 0.01;
  }



  if (key == 'v') {
    v_mult += 0.01;
  }

  if (key == 'V') {
    v_mult -= 0.01;
  }

  if (key == 's') {
    spark_diff += 5;
  }

  if (key == 'S') {
    if (spark_diff > -30) {
      spark_diff -= 5;
    }
  }

  if (key == 'r') {
    g_mult = 1;
    v_mult = 1;
    spark_diff = 0;
    s_R = 250;
    s_G = 255;
    s_B = 90;
    secondary = false;
  }

  if (key == 'i') {
    s_R += CI;
  }

  if (key == 'o') {
    s_G += CI;
  }

  if (key == 'p') {
    s_B += CI;
  }

  if (key == 'I') {
    s_R -= CI;
  }

  if (key == 'O') {
    s_G -= CI;
  }

  if (key == 'P') {
    s_B -= CI;
  }
  if (key == ']') {
    secondary = !secondary;
  }
  //println(activate);
  //the above println was for debuging
}
