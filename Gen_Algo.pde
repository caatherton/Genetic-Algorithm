//Worked with Celia Wood
ArrayList<Painting> paintings;
Painting kidA, kidB, kidC, kidD, parentA, parentB;

int gen;
float mutRate=1;
int NofOFin;

void setup() {
  size(500, 500);
  textSize(26);
  paintings = new ArrayList<Painting>();
  //Creating the parents and kids
  kidA= new Painting(floor(random(1, 10)));
  kidB= new Painting(floor(random(1, 10)));
  kidC =new Painting(floor(random(1, 10)));
  kidD =new Painting(floor(random(1, 10)));
  parentA =new Painting(floor(random(1, 10)));
  parentB =new Painting(floor(random(1, 10)));
  //Adding the first kids and parents to the Array
  paintings.add(kidA);
  paintings.add(kidB);
  paintings.add(kidC);
  paintings.add(kidD);
  paintings.add(parentA);
  paintings.add(parentB);
}
void draw() { 
   //Writing the generation
  background(255);
  fill(0);
  textSize(26);
  text("gen:" + gen, 215, 150);
  textSize(18);
  //Writing the fitness of the kids
  text(kidA.fitness, 60, 350);
  text(kidB.fitness, 180, 350);
  text(kidC.fitness, 305, 350);
  text(kidD.fitness, 430, 350);
  //Drawing the kids
  kidA.drawpainting(10, 195);
  kidB.drawpainting(130, 195);
  kidC.drawpainting(255, 195);
  kidD.drawpainting(380, 195);
}
//Randomly selecting one of the choices of the weighted list
float getit(FloatList w) {
  float total=0;
  for (int i=0; i<w.size(); i++) {
    total=total+w.get(i);
  }
  float random=random(total);
  for (int i=0; i<w.size(); i++) {
    if (random<w.get(i)) {
      float _i = i;
      return _i;
    }
    random=random-w.get(i);
  }
  return total;
}

void keyPressed() {
  if (key == ' ') {
//Finding the largest fitnesses
    int largestp=5;
    int largestp2=5;
    int largest=kidA.fitness;
    for (int j=0; j<3; j++) {
      if (largest<paintings.get(j).fitness) {
        largestp = j;
        largest = paintings.get(j).fitness;
      }
    }
    parentA=paintings.get(largestp);
    largest=kidA.fitness;
    for (int j=0; j<3; j++) {
      if ((largest<paintings.get(j).fitness) && (j!= largestp)) {
        largestp2 = j;
        largest = paintings.get(j).fitness;
      }
    }
    //telling the parents to breed
    parentB=paintings.get(largestp2);
    kidA = parentA.breed(parentB);
    kidB = parentA.breed(parentB);
    kidC = parentA.breed(parentB);
    kidD = parentA.breed(parentB);
    gen++;
  }
  //clear the last kids to make way for the new ones
  paintings.clear();
  paintings.add(kidA);
  paintings.add(kidB);
  paintings.add(kidC);
  paintings.add(kidD);
  paintings.add(parentA);
  paintings.add(parentB);
}
