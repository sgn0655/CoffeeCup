void setup() {
  size(600, 800);
  smooth();
  noLoop();
}

void draw() {
  background(245, 240, 235);

  // 배경 그림자
  noStroke();
  fill(0, 0, 0, 25);
  ellipse(width/2, 700, 220, 40);

  // 컵 위치 기준
  float cx = width / 2;
  float topY = 220;
  float bottomY = 620;
  float topW = 220;
  float bottomW = 150;

  // 커피(컵 안쪽에 먼저 그림)
  drawCoffee(cx, topY, bottomY, topW, bottomW);

  // 얼음
  drawIce(cx, topY, bottomY, topW, bottomW);

  // 플라스틱 컵
  drawCup(cx, topY, bottomY, topW, bottomW);

  // 뚜껑
  drawLid(cx, topY, topW);

  // 빨대
  drawStraw(cx, topY);

  // 하이라이트
  drawHighlight(cx, topY, bottomY, topW, bottomW);
}

void drawCoffee(float cx, float topY, float bottomY, float topW, float bottomW) {
  // 커피 높이
  float coffeeTopY = 340;
  float coffeeBottomY = bottomY - 8;

  noStroke();
  fill(110, 70, 40, 190);  // 반투명 갈색

  beginShape();
  vertex(cx - map(coffeeTopY, topY, bottomY, topW/2 - 12, bottomW/2 - 12), coffeeTopY);
  vertex(cx + map(coffeeTopY, topY, bottomY, topW/2 - 12, bottomW/2 - 12), coffeeTopY);
  vertex(cx + (bottomW/2 - 12), coffeeBottomY);
  vertex(cx - (bottomW/2 - 12), coffeeBottomY);
  endShape(CLOSE);

  // 커피 윗면
  float coffeeTopW = map(coffeeTopY, topY, bottomY, topW - 24, bottomW - 24);
  fill(125, 80, 45, 210);
  ellipse(cx, coffeeTopY, coffeeTopW, 26);

  // 커피 아래쪽 진한 느낌
  fill(90, 55, 30, 60);
  ellipse(cx, coffeeBottomY, bottomW - 24, 18);
}

void drawIce(float cx, float topY, float bottomY, float topW, float bottomW) {
  fill(255, 255, 255, 90);
  stroke(220, 240, 255, 120);
  strokeWeight(1.5);

  // 얼음 조각들
  rectMode(CENTER);
  pushMatrix();
  translate(cx - 45, 385);
  rotate(radians(-12));
  rect(0, 0, 40, 40, 8);
  popMatrix();

  pushMatrix();
  translate(cx + 20, 410);
  rotate(radians(10));
  rect(0, 0, 42, 42, 8);
  popMatrix();

  pushMatrix();
  translate(cx - 5, 470);
  rotate(radians(-8));
  rect(0, 0, 38, 38, 8);
  popMatrix();

  pushMatrix();
  translate(cx + 35, 520);
  rotate(radians(15));
  rect(0, 0, 36, 36, 8);
  popMatrix();

  pushMatrix();
  translate(cx - 35, 545);
  rotate(radians(7));
  rect(0, 0, 34, 34, 8);
  popMatrix();

  rectMode(CORNER);
}

void drawCup(float cx, float topY, float bottomY, float topW, float bottomW) {
  stroke(180, 190, 200, 180);
  strokeWeight(3);
  fill(255, 255, 255, 45);   // 투명 플라스틱 느낌

  beginShape();
  vertex(cx - topW/2, topY);
  vertex(cx + topW/2, topY);
  vertex(cx + bottomW/2, bottomY);
  vertex(cx - bottomW/2, bottomY);
  endShape(CLOSE);

  // 컵 윗테두리
  fill(255, 255, 255, 65);
  ellipse(cx, topY, topW, 30);

  // 컵 아랫부분
  noFill();
  ellipse(cx, bottomY, bottomW, 18);

  // 컵 옆면 라인
  line(cx - topW/2, topY, cx - bottomW/2, bottomY);
  line(cx + topW/2, topY, cx + bottomW/2, bottomY);
}

void drawLid(float cx, float topY, float topW) {
  noStroke();
  fill(235, 240, 245, 220);
  ellipse(cx, topY - 18, topW + 30, 34);

  fill(220, 225, 230, 230);
  rectMode(CENTER);
  rect(cx, topY - 25, 22, 10, 4);
  rectMode(CORNER);
}

void drawStraw(float cx, float topY) {
  stroke(40, 40, 40, 180);
  strokeWeight(8);
  line(cx + 35, topY - 120, cx + 15, topY - 25);

  stroke(60, 60, 60, 120);
  strokeWeight(3);
  line(cx + 39, topY - 120, cx + 19, topY - 25);
}

void drawHighlight(float cx, float topY, float bottomY, float topW, float bottomW) {
  noStroke();
  fill(255, 255, 255, 90);

  // 왼쪽 세로 하이라이트
  beginShape();
  vertex(cx - 55, 255);
  vertex(cx - 35, 255);
  vertex(cx - 20, 600);
  vertex(cx - 40, 600);
  endShape(CLOSE);

  // 오른쪽 작은 반사광
  fill(255, 255, 255, 45);
  beginShape();
  vertex(cx + 45, 300);
  vertex(cx + 60, 300);
  vertex(cx + 48, 520);
  vertex(cx + 34, 520);
  endShape(CLOSE);
}
