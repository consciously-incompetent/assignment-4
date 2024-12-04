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
text("gravity = " + round(g_mult*10) + "  velocity = " +  round(v_mult*10) + "   additional sparks = " + spark_diff,110,125);




}












}
