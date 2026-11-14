float x, y, learning_rate;
PVector grad, target;
boolean newTarget = false;
void setup() {
  size(800, 600);
  target = new PVector(width/2, height/2);
  learning_rate = 0.01;
  x = 102;
  y = 109;
  grad = gradientV(x, y);
}
// f(x,y) = (x-40)^2 + (y+100)^2
float df_dx(float x, float y) {
  return 2*(x-target.x);
}
float df_dy(float x, float y) {
  return 2*(y-target.y);
}
// gradient vector
PVector gradientV(float x, float y) {
  return  new PVector(df_dx(x, y), df_dy(x, y));
}

void draw() {
  background(240);
  // move the origin to centre of the screen
  //translate(width/2, height/2);
  // axis
  stroke(210);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  fill(231, 76, 60);
  noStroke();
  
  circle(target.x, target.y, 8);
  fill(14, 144, 14);
  updateGradient();
  float grad_mag = grad.mag();
  circle(x, y, 8);
  if (grad_mag >= 0.01) {
    x -= learning_rate * grad.x;
    y -= learning_rate * grad.y;
    
    println(x, y);
  }
 
}

void updateGradient(){
  grad = gradientV(x, y);
}

void keyPressed(){
    target.x = random(20,width-20);
    target.y = random(20,height-20);
    updateGradient();
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
  // recalc gradient vector
  updateGradient();
}
