class Baby_spark {
  PVector location;
  PVector velocity;
  boolean visible;








  Baby_spark(float tempX, float tempY, float temp_g_mult, float temp_v_mult) {
    location = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 1));

    location.x = tempX;
    location.y = tempY;
  }


  void display() {
    fill(s_B, s_R, s_G);
    rect(location.x, location.y, 2, 2);
  }

  void move() {
    location.add(velocity);
    velocity.x *= 1.1;
    velocity.y *= 1.1;
  }

  void update() {
    if (location.x  > 400) {
      if (location.y > 400) {
        visible = false;
      }
    }
  }

  //void update(){
  //  location.x = tempX;
  //  location.y = tempY;

  //}
}
