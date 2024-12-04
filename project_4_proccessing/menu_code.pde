class Menu {
//int x = 0;
//int y = 0;
float R = 255;
float G = 255;
float B = 255;

Menu(){
R = random(255);
G = random(255);
B = random(255);
}


void display(){
rectMode(CORNER);
fill(R,G,B);
rect(100,100, 250,250);
fill(0,0,0);
text("gravity = " + round(g_mult*100) + "  velocity = " +  round(v_mult*10) + "    sparks = " + (spark_diff+35),110,125);
fill(s_R,s_G,s_B);
rect(250,250, 25,25);



}












}
