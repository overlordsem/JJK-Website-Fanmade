float x1 = mouseX;
float x2 = mouseX;
float y1 = 0;
float y2 = 0;
float x3 = mouseX;
float y3 = 0;
float speed1;
float speed2;
float speed3 = 6;
int score = 0;
boolean thirdCubeActive = false;

void setup() {
  size(500, 500);
  textSize(50);
  speed1 = random(3, 8);
  speed2 = random(1, 5);
}

void draw() {
  background(80, 200, 250);
  if (score >= 15) {
    background(20, 300, 100);
  }

  if (score < 50) {
    y1 = y1 + speed1;
    rect(x1, y1, 20, 20);

    y2 = y2 + speed2;
    rect(x2, y2, 20, 20);

    if (thirdCubeActive) {
      y3 = y3 + speed3;
      rect(x3, y3, 20, 20);
    }

    text("score " + score, 15, 50);
    rect(mouseX - 50, 450, 100, 20);

    if (y1 > height) {
      y1 = 0;
      x1 = random(width);
      speed1 = random(1, 10);
      println("Score Reset, Try Again");
      score = 0;
      thirdCubeActive = false;
    }

    if (y2 > height) {
      y2 = 0;
      x2 = random(width);
      speed2 = random(1, 10);
      print("Score Reset, Try Again");
      score = 0;
      thirdCubeActive = false;
    }

    if (y3 > height && thirdCubeActive) {
      y3 = 0;
      x3 = random(width);
    }

    if (y1 + 20 >= 450 && y1 <= 450 + 20 && x1 + 20 >= mouseX - 50 && x1 <= mouseX + 50) {
      y1 = 0;
      x1 = random(width);
      speed1 = random(1, 10);
      score++;
    }

    if (y2 + 20 >= 450 && y2 <= 450 + 20 && x2 + 20 >= mouseX - 50 && x2 <= mouseX + 50) {
      y2 = 0;
      x2 = random(width);
      speed2 = random(1, 10);
      score++;
    }

    if (score >= 15 && !thirdCubeActive) {
      thirdCubeActive = true;
      x3 = random(width);
      y3 = 0;
    }

    if (thirdCubeActive && y3 + 20 >= 450 && y3 <= 450 + 20 && x3 + 20 >= mouseX - 50 && x3 <= mouseX + 50) {
      y3 = 0;
      x3 = random(width);
      score++;
    }
  } else {
    background(0, 255, 0);
    text("Victory", width / 2 - 100, height / 2);
  }
}
