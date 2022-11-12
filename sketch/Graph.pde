import java.util.concurrent.ThreadLocalRandom;
import java.lang.Math;


class Graph {
  public byte[][] matrix;
  public int n;//number of vertexes

//creates empty object
  public Graph() {
  }

//creates object with given adjacency matrix
  public Graph(byte[][] matrix, int n) {
    this.matrix = matrix;
    this.n = n;
  }

  public void fill(int n) {
    this.n = n;
    matrix = new byte[n][n];
    for (int i = 1; i < n; ++i) {
      for (int j = 0; j != i; ++j) {
        matrix[i][j] = (matrix[j][i] = 1);
      }
    }
  }


//algorithm generating random graph with n vertexes and p as a probability of creation of edge connecting each pair of vertexes
  public void gnp(int n, double p) {
    this.n = n;
    matrix = new byte[n][n];
    for (int i = 1; i < n; ++i) {
      for (int j = 0; j != i; ++j) {
        if (ThreadLocalRandom.current().nextDouble(0.0, 1.0) <= p) {
          matrix[i][j] = (matrix[j][i] = 1);
        } else {
          matrix[i][j] = (matrix[j][i] = 0);
        }
      }
    }
  }
}
