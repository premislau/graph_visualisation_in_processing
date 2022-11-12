import java.util.HashSet;
import java.util.Set;
import java.util.Iterator;

Graph graph;
GraphShower graphShower;

Iterator resultIterator;
Set<Integer> shownSubgraph;


int subgraphIndex;

void setup() {
  size(800, 600);
  graph=new Graph();
  graph.gnp(12, 0.6);
  graphShower=new GraphShower(graph, width/2, height/2, width-100, height-100, 20, 2);

  BronKerbosch bk= new BronKerbosch(graph);
  bk.run();
  resultIterator=bk.achievedCliques.iterator();
  shownSubgraph=(Set<Integer>)resultIterator.next();
}

void draw() {
  background(0);
  stroke(255);
  graphShower.show();
  stroke(255, 0, 0);
  graphShower.markSubgraph(shownSubgraph);
  if (!resultIterator.hasNext()) {
    noLoop();
  }
}

void keyPressed(){
  if(key == ' '){
    shownSubgraph=(Set<Integer>)resultIterator.next();
  }
}
