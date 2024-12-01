//making an empy list for the fireworks //<>//
Firework[] fireworks = new Firework[5];
Menu menu;
//variable for which rocket to acitvate
int activate = -1;

//menu variable
float g_mult = 0;
float v_mult = 1;
int spark_diff = 0;


//marks down if the rockets have been made yet or not.
//why? so that they arn't repeatadly made at the start of each draw loop
boolean depleted = false;
boolean menu_ONOFF = false;
void setup() {
  // and creating the size of the background
  size(400, 400);
  menu = new Menu();
  // for (int i = 0; i < fireworks.length; i++) {
  //fireworks[i] = new Firework(40 + (i*80), height-45);
  //  }
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
  if (!depleted) {
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i] = new Firework(40 + (i*80), height-45,g_mult,v_mult);
      depleted = true;
    }
  }
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
    
    if(menu_ONOFF){
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
    
    if (key == 'm'){
      if(!menu_ONOFF){
      menu_ONOFF = true;}
      else {
      menu_ONOFF = false;
      }
    
    }
    
    if (key == 'g'){
    g_mult += 0.1;
    }
    
    if(key == 'v'){
    v_mult += 0.1;
    }
    
    if (key == 's'){
    spark_diff += 5;
    }
    
    //println(activate);
    //the above println was for debuging
  }
