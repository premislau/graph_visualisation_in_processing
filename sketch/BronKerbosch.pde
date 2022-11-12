import java.util.HashSet;
import java.util.Set;

//This class contains implementation of Bron-Kerbosch algorithm. It is used to extract maximal cliques in a graph.
public class BronKerbosch {
  public Graph graph;
  public Set<Set<Integer>> achievedCliques;

  public BronKerbosch(Graph graph) {
    this.graph = graph;
    achievedCliques = new HashSet<Set<Integer>>();
  }

  public void run() {
    Set<Integer> candidates = new HashSet<Integer>();
    for (int i = 0; i < graph.n; ++i) {
      candidates.add(i);
    }
    bronKerbosch(new HashSet<Integer>(), candidates, new HashSet<Integer>());
  }

  public void bronKerbosch(Set<Integer> compsub, Set<Integer> candidates, Set<Integer> not) {
    if (candidates.isEmpty() && not.isEmpty()) {
      achievedCliques.add(compsub);
    } else {
      Set<Integer> copyOfCandidates = new HashSet<>(candidates);
      for (int e : copyOfCandidates) {
        Set<Integer> newCompsub = new HashSet<Integer>(compsub);
        newCompsub.add(e);
        Set<Integer> ne = neighbours(e);
        Set<Integer> newCandidates = new HashSet<Integer>(candidates);
        newCandidates.retainAll(ne);
        Set<Integer> newNot = new HashSet<Integer>(not);
        newNot.retainAll(ne);
        bronKerbosch(newCompsub, newCandidates, newNot);
        candidates.remove(e);
        not.add(e);
      }
    }
  }

  public HashSet<Integer> prepareIterationCopy(Set<Integer> candidates, Set<Integer> not) {
    HashSet<Integer> potentialPivots = new HashSet<>(candidates);
    potentialPivots.addAll(not);
    int pivot = choosePivotVertex(potentialPivots, candidates);
    HashSet<Integer> result = new HashSet<>(candidates);
    result.removeAll(neighbours(pivot));
    return result;
  }

  public int choosePivotVertex(Set<Integer> potentialPivots, Set<Integer> candidates) {
    int indexOfBestPivot = 0;
    int bestResult = 0;
    for (int e : potentialPivots) {
      Set<Integer> ne = neighbours(e);
      ne.retainAll(candidates);
      if (ne.size() > bestResult) {
        bestResult = ne.size();
        indexOfBestPivot = e;
      }
    }
    return indexOfBestPivot;
  }

  public Set<Set<Integer>> getGreatestCliques() {
    Set<Set<Integer>> result = new HashSet<Set<Integer>>();
    int maxSize = 0;
    for (Set<Integer> e : achievedCliques) {
      if (e.size() == maxSize) {
        result.add(e);
      } else if (e.size() > maxSize) {
        maxSize = e.size();
        result.clear();
        result.add(e);
      }
    }
    return result;
  }

  private Set<Integer> neighbours(int vertex) {
    Set<Integer> result = new HashSet<Integer>();
    for (int i = 0; i < graph.n; ++i) {
      if (graph.matrix[i][vertex] == 1) {
        result.add(i);
      }
    }
    return result;
  }

  public String achivedCliqesToString() {
    return achievedCliques.toString();
  }
}
