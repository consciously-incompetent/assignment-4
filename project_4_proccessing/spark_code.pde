class Spark {
  // for the third and final time i set up variables and PVectors
  PVector location;
  PVector velocity;
  float g_mult;
  float v_mult;
  int spark_diff = 0;
  boolean explode = false;
  int flight_counter;
  Baby_spark[] Baby_sparks = new Baby_spark[5];

  Spark(float tempY, float tempX, float temp_g_mult, float temp_v_mult) {
    flight_counter = 0;
    //fill the PVectors with information
    // including setting their postion to the last postion the firework was at
    location = new PVector(0, 0);
    //makes its velocity random so they go in random directions
    velocity = new PVector(random(-1, 1), random(-1, 1));
    g_mult = temp_g_mult;
    v_mult = temp_v_mult;
    location.x = tempX;
    location.y = tempY;
    //for (int i = 0; i < Baby_sparks.length; i++) {
    //  Baby_sparks[i] = new Baby_spark(location.x, location.y, g_mult, v_mult);
    //}
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
    //the velocity and gravity multipliers are applied here
    velocity.x *= 1.1*v_mult;
    velocity.y *= 1.1*v_mult;
    flight_counter += 1;
    if (!explode) {
      for (int i = 0; i < Baby_sparks.length; i++) {
        Baby_sparks[i] = new Baby_spark(location.x, location.y, g_mult, v_mult);
      }
    }
    //println(flight_counter);
    //the below velocity change is meant to represent gravity
    // the sparks flie pretty fast so its kinda hard to notice
    velocity.y *= 0.97*g_mult;



    if ( (flight_counter == 50 && secondary) || explode ) {
      explode = true;
      for (int i = 0; i < Baby_sparks.length; i++) {
        Baby_sparks[i].display();
        Baby_sparks[i].move();
        Baby_sparks[i].update();
      }
    }
  }
}
