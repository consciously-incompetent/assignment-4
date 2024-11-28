class Firework { //<>//
  //the fireworks variables are made
  //and its Pvectors which techincally arn't variables
  PVector location;
  PVector velocity;
  boolean clicked = false;
  boolean exploded = false;
  //the creates an empty list for the explosio sparks to go
  Spark[] sparks = new Spark[35];

  Firework(float tempX, float tempY) {
    //fill  some of those aforementioned variables with information
    //(and the PVector)
    location = new PVector(0, 0);
    velocity = new PVector(1, -1);
    location.x = tempX;
    location.y = tempY;
  }

  void display() {
    //draws the firework
    //also checks if its exploded or not and if it is stops drawing the firework
    if (!exploded) {
      fill(200, 20, 50);
      rect(location.x, location.y, 20, 40);
    }
  }

  void Launch() {
    //if the clicked variable is true increase the rockets y positon
    //it zoooooooms
    if (clicked) {
      location.y += velocity.y;
      velocity.y -= 0.5;
    }
  }

  void exploded() {
    // this function does a lot
    //first it checks if the exploded variable is true if its not we fill the emptyu sparks list
    if (!exploded) {
      for (int i = 0; i < sparks.length; i++) {
        sparks[i] = new Spark(location.x, location.y);
      }
    }
    //second it sets the explode variable to true and the clicked variabel to flase
    //this is to ensure the firework doesnt intilize the sparks more then once and to hide the fireworks body
    // the clicked variable is set to false so it doenst continue moving(even though you cant see the rocket)
    exploded = true;
    clicked = false;
    //finally it displays the sparks and moves the sparks
    for (int i = 0; i < sparks.length; i++) {
      sparks[i].display();
      sparks[i].flie();
    }
  }
}
