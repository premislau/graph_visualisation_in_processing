# graph_visualisation
This project purpose is visualising graphs and specified subghraph within them. It is meant to be used to show outcomes (or even steps) of algorithms used process graphs e. g. maximal cliques algorithms.
It is made using Java language in Processing enviroment (https://processing.org). License of this project is MIT License.

# Topic
	### Graph
		Graph is a structure which are characterised by vertexesa and edges connecting pairs of these vertexes. Some graphs are also characterised by a weight assigned to each edge; graphs of this kind are called weighted graphs.
	### Clique
		Clique is a subgraph in which all possible edge exists (all vertexes are directly connected to eachother). Maximal clique is a clique which is not contained by any larger clique (it cannot be expanded remaining a lique). Max clique is a clique which conatins the most vertexes (in unweighted graph) or contains highest sum of weights (in weighted graph).
		

# Project structure
	### sketch/sketch.pde
		Main Processsing file. It contains setup and draw procedures.
	### sketch/Graph.pde
		Specyfies Graph class which is used to generate and store information about graphs.
	### sketch/BronKerbosch.pde
		Implements Bron-Kerbosch algorithm. This algorithm is used to find all maximal cliques in a graph.
	### sketch/GraphShower.pde
		Specifies class GraphShower; GraphShower object is used to show (using Processing procedures) a Graph object which it is affilated with. This class also contains markSubgraph method which can be used e. g. to mark a clique inside a graph.
		