class Spark {
  // for the third and final time i set up variables and PVectors
  PVector location;
  PVector velocity;


  Spark(float tempY, float tempX) {
    //fill the PVectors with information
    // including setting their postion to the last postion the firework was at
    location = new PVector(0, 0);
    //makes its velocity random so they go in random directions
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location.x = tempX;
    location.y = tempY;
  }

  void display() {
    //draws the spark
    noStroke();
    fill(250, 255, 90);
    ellipseMode(CENTER);
    ellipse(location.y, location.x, 2, 2);
  }

  void flie() {
    //moves the spark
    location.add(velocity);
    velocity.x *= 1.1;
    velocity.y *= 1.1;
    //the below velocity change is meant to represent gravity
    // the sparks flie pretty fast so its kinda hard to notice
    velocity.y *= 0.97;
  }
}