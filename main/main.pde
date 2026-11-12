float x, y, learning_rate;
PVector grad, target;
void setup() {
  size(800, 600);
  target = new PVector(0, 0);
  learning_rate = 0.01;
  x = 102;
  y = 9;
  grad = gradientV(x, y);
}
// f(x,y) = x^2 + y^2
float df_dx(float x, float y) {
  return 2*x;
}
float df_dy(float x, float y) {
  return 2*y;
}
// gradient vector
PVector gradientV(float x, float y) {
  return  new PVector(df_dx(x, y), df_dy(x, y));
}

void draw() {
  background(240);
  // move the origin to centre of the screen
  translate(width/2, height/2);
  // axis
  stroke(210);
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0, height / 2);
  fill(231, 76, 60);
  noStroke();
  circle(target.x, target.y, 8);
  fill(14, 144, 14);
  float grad_mag =grad.mag();
  circle(x, y, 8);
  if (grad_mag >= 0.01) {
    x -= learning_rate * grad.x;
    y -= learning_rate * grad.y;
    grad = gradientV(x, y);
    println(x, y);
  }
}

void mousePressed() {
  x = mouseX - width / 2;
  y = mouseY - height / 2;
  // recalc gradient vector
  grad = gradientV(x, y);
}
