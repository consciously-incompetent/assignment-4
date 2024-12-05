class Firework { //<>//
  //the fireworks variables are made
  //and its Pvectors which techincally arn't variables
  PVector location;
  PVector velocity;
  // this PVector is for the velocity modifer so that variable can intereact with the rest of the PVector code
  PVector pv_mult;
  boolean clicked = false;
  boolean exploded = false;
  //don't know how neccasary these variables are but they are for the g_mult and v_mult variables from the main page
  float g_mult = 0;
  float v_mult = 0;

  //the creates an empty list for the explosio sparks to go
  Spark[] sparks = new Spark[35+spark_diff];

  Firework(float tempX, float tempY, float temp_g_mult, float temp_v_mult) {
    //fill  some of those aforementioned variables with information
    //(and the PVector)
    location = new PVector(0, 0);
    velocity = new PVector(1, -1);

    //makes the pv_mult = to the v_mult from the main page
    pv_mult = new PVector(temp_v_mult, temp_v_mult);

    //same as above but for these variables isntead of the PVector
    g_mult = temp_g_mult;
    v_mult = temp_v_mult;

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
      //uses the veloctiy multiplier to increase the speed it moves at
      location.y += velocity.y*pv_mult.y;
      velocity.y -= 0.5;
    }
  }

  void exploded() {
    // this function does a lot
    //first it checks if the exploded variable is true if its not we fill the emptyu sparks list
    if (!exploded) {
      for (int i = 0; i < sparks.length; i++) {
        sparks[i] = new Spark(location.x, location.y, g_mult, v_mult);
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
