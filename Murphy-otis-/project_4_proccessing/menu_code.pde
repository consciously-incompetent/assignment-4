class Menu {
//int x = 0;
//int y = 0;

//menu colour variables
float R = 255;
float G = 255;
float B = 255;

Menu(){
  //random colour for the menu 
  //might change for submission unless i forget too
R = random(255);
G = random(255);
B = random(125,255);
}


void display(){
  //displays the meny 
rectMode(CORNER);
fill(R,G,B);
rect(100,100, 250,250);
fill(0,0,0);
//rights out text thats tells relevent information about the firework like colour velocity and how many sparks are in it
text("gravity = " + round(g_mult*100) + "  velocity = " +  round(v_mult*100) + "    sparks = " + (spark_diff+35),110,125);
// this cube is used to show the user the colour of the sparks 

text("secondary rockets is " + secondary +"         rocket colour", 110,245);
fill(s_R,s_G,s_B);
rect(250,250, 25,25);



}












}