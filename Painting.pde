class Painting {
  ArrayList<DNA> dna;
  int NofShapes;
  int fitness;
  FloatList pweights;
  float choice;
  Painting(int _NofShapes) {
    NofShapes=_NofShapes;
    //creating the weighted list for the fitnesses
    pweights = new FloatList();
    dna = new ArrayList<DNA>();
    for (int i=0; i< NofShapes; i++) {
      dna.add(new DNA());
    }
    fitness = NofShapes;
  }
  void drawpainting(int x, int y) {
    //drawing the painting
    noFill();
    stroke(0);
    pushMatrix();
    translate(x, y);
    rect(0, 0, 110, 110);
    for (int i=0; i < NofShapes; i++) {
      if (i<dna.size()) {
        dna.get(i).drawShape();
      } else {
        dna.get(0).drawShape();
      }
    }
    popMatrix();
  }
  Painting breed(Painting mate) {
    //adding the parents' fitnesses to the list
    pweights.append(parentA.fitness);
    pweights.append(parentB.fitness);
    pweights.append(mutRate);

    Painting kid;
    choice = getit(pweights);
    //flipping the coin for different characteristics of the parents
    if (choice== 1) {
      kid= new Painting(mate.NofShapes);
    } else if(choice==0){
      kid= new Painting(this.NofShapes);
    }else{
      kid= new Painting(floor(random(1,10)));       
    }
    for (int i =0; i < kid.NofShapes; i++) {
      choice = getit(pweights);
      if (choice==1) {
        if (i<mate.dna.size()) {
          println(kid.dna.size());
          println(kid.NofShapes);
          kid.dna.get(i).x=mate.dna.get(i).x;
          kid.dna.get(i).y=mate.dna.get(i).y;
          kid.dna.get(i).shapecolor=mate.dna.get(i).shapecolor;
          kid.dna.get(i).shape=mate.dna.get(i).shape;
          kid.dna.get(i).w=mate.dna.get(i).w;
          kid.dna.get(i).h=mate.dna.get(i).h;
        } else {
          kid.dna.get(i).x=mate.dna.get(0).x;
          kid.dna.get(i).y=mate.dna.get(0).y;
          kid.dna.get(i).shapecolor=mate.dna.get(0).shapecolor;
          kid.dna.get(i).shape=mate.dna.get(0).shape;
          kid.dna.get(i).w=mate.dna.get(0).w;
          kid.dna.get(i).h=mate.dna.get(0).h;
        }
      } else if (choice == 0) {
        if (i<this.dna.size()) {
          kid.dna.get(i).x=this.dna.get(i).x;
          kid.dna.get(i).y=this.dna.get(i).y;
          kid.dna.get(i).shapecolor=this.dna.get(i).shapecolor;
          kid.dna.get(i).shape=this.dna.get(i).shape;
          kid.dna.get(i).w=this.dna.get(i).w;
          kid.dna.get(i).h=this.dna.get(i).h;
        } else {
          kid.dna.get(i).x=this.dna.get(0).x;
          kid.dna.get(i).y=this.dna.get(0).y;
          kid.dna.get(i).shapecolor=this.dna.get(0).shapecolor;
          kid.dna.get(i).shape=this.dna.get(0).shape;
          kid.dna.get(i).w=this.dna.get(0).w;
          kid.dna.get(i).h=this.dna.get(0).h;
        }
      } else {
        //mutation
        kid.dna.get(i).x=floor(random(20, 95));
        kid.dna.get(i).y=floor(random(20, 95));
        kid.dna.get(i).shapecolor=color(floor(random(255)), floor(random(255)), floor(random(255)));
        kid.dna.get(i).shape=floor(random(1, 4));
        kid.dna.get(i).w=floor(random(1, 20));
        kid.dna.get(i).h=floor(random(1, 20));
      }
    }
    //decreasing the mutation rate each time
    mutRate = mutRate*0.95;
    println(pweights);
    //clearing the fitnesses to make way for the new fitnesses
    pweights.clear();
    return kid;
  }
}
