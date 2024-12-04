class Spark {
  // for the third and final time i set up variables and PVectors
  PVector location;
  PVector velocity;
  float g_mult;
  float v_mult;
  int spark_diff = 0;

  Spark(float tempY, float tempX, float temp_g_mult, float temp_v_mult) {
    //fill the PVectors with information
    // including setting their postion to the last postion the firework was at
    location = new PVector(0, 0);
    //makes its velocity random so they go in random directions
    velocity = new PVector(random(-1, 1), random(-1, 1));
     g_mult = temp_g_mult;
     v_mult = temp_v_mult;
    location.x = tempX;
    location.y = tempY;
  }

  void display() {
    //draws the spark
    noStroke();
    fill(s_R, s_G, s_B);
    ellipseMode(CENTER);
    ellipse(location.y, location.x, 2, 2);
  }

  void flie() {
    //moves the spark
    location.add(velocity);
    velocity.x *= 1.1*v_mult;
    velocity.y *= 1.1*v_mult;
    //the below velocity change is meant to represent gravity
    // the sparks flie pretty fast so its kinda hard to notice
    velocity.y *= 0.97+g_mult;
  }
}
