class DNA{
  int x;
  int y;
  color shapecolor;
  int whatshape;
  int h, w;
  int shape;
  DNA(){
    x=floor(random(20,75));
    y=floor(random(20,75));
    shapecolor = color(floor(random(255)),floor(random(255)),floor(random(255)));
    h = floor(random(1,30));
    w = floor(random(1,30));
    shape=floor(random(1,4));
    stroke(shapecolor);
  }
  void drawShape() {
    //randomly chooses the shape and draws it
    fill(shapecolor);
    if(shape == 1) {
      ellipse(x,y,h,w);
    }else if(shape == 2) {
      rect(x,y,h,w);
    }else if(shape==3) {
      triangle(x,y,x+w,y,x,y+h);
    }
  }
}
