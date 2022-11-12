//class designed to show graphs using processing enviroment
class GraphShower {
  public Graph graph;
  public int xCenter;
  public int yCenter;
  public int xSemiAxe;
  public int ySemiAxe;
  public int vertexStrokeWeight;
  public int edgeStrokeWeight;
  public PVector[] vertexLocations;


  public GraphShower(Graph graph, int xCenter, int yCenter, int w, int h) {
    this(graph, xCenter, yCenter, w, h, 20, 2);
  }

  public GraphShower(Graph graph, int xCenter, int yCenter, int w, int h, int vertexStrokeWeight, int edgeStrokeWeight) {
    this.graph=graph;
    this.xCenter=xCenter;
    this.yCenter=yCenter;
    this.xSemiAxe=w/2;
    this.ySemiAxe=h/2;
    this.vertexLocations = new PVector[graph.n];
    calculateVertexLocations();
    this.vertexStrokeWeight=vertexStrokeWeight;
    this.edgeStrokeWeight=edgeStrokeWeight;
  }

  public void calculateVertexLocations() {
    float angle=0;
    float dAngle=TWO_PI/graph.n;
    for (int i=0; i<graph.n; ++i) {
      vertexLocations[i]=new PVector(xCenter+xSemiAxe*cos(angle), yCenter+ySemiAxe*sin(angle));
      angle+=dAngle;
    }
  }

  public void show() {
    showEdges();
    showVertexes();
  }

  public void showVertexes() {
    strokeWeight(vertexStrokeWeight);
    for (int i=0; i<vertexLocations.length; ++i) {
      point(vertexLocations[i].x, vertexLocations[i].y);
    }
  }

  public void showEdges() {
    strokeWeight(edgeStrokeWeight);
    for (int i=0; i<graph.n; ++i) {
      for (int j=i+1; j<graph.n; ++j) {
        if (graph.matrix[i][j]==1) {
          line(vertexLocations[i].x, vertexLocations[i].y,
            vertexLocations[j].x, vertexLocations[j].y);
        }
      }
    }
  }

  public void markSubgraph(Set<Integer> vertexes) {
    for (Integer vertex : vertexes) {
      strokeWeight(vertexStrokeWeight);
      point(vertexLocations[vertex].x, vertexLocations[vertex].y);
      strokeWeight(edgeStrokeWeight);
      for (int i=vertex+1; i<graph.n; ++i) {
        if(vertexes.contains(i)){
          line(vertexLocations[vertex].x, vertexLocations[vertex].y,
            vertexLocations[i].x, vertexLocations[i].y);
        }
      }
    }
  }
}
