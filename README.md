For this assignment I used graph from Igraph library named „Krackhardt_Kite“.
For directed graph algorithms I modified the same graph to make it directed.
1. Local clustering coefficent
Local clustering coefficent measures the tendency of a network to cluster. I calculated lcc for
every node in graph. Notable cases include – N4 that has the best clustering coefficent because
its neighbors are wery well connected, N9 and N10 have clustering coefficent as 0 because N9
neighbors(N8 and N10 are not connected to each other) and N10 has only one neighbor.

2. Degree centrality
Degree centrality measures how well connected node is in the graph. As this is a fraction of node
degree and maximum possible degree of nodes. If the result is 1 then node is connected to all
the other nodes. Notable cases include – N4 has the highest degree centrality because it is
connected to the most other nodes and N10 has the lowest score because it is connected to the
only one node out of 9 possible connections.

3. Degree prestige
Degree prestige is defined for directed networks only. It works similarly like Degree centrality but
instead of the node degree, node degree of incoming edges are used. Result is 1 if there is
directed edge from every node to this node. Notable cases include – N1 that has the highest
degree prestige because it has the most incoming node connections and N10 with the lowest
score because that does not have incoming edges.

4. Gregariousness of a node
Gregariousness of a node is the opposite of the degree prestige- instead of node degree of
incoming nodes, node degree of outgoing nodes are used. It also describes the behaviour of a
node to seek out new connections. Notable cases include –N7 has the highest score because it
has the most outgoing edges and N1 has the lowest score(0), because it does not have any
outgoing edges.

5. Closeness centrality 
Closeness centrality is the inverse of the average distance of one node to the all other nodes. It
ranges between 0 and 1 and bigger values means better closeness centrality. Notable cases
include – N6, N7 have the highest score because they have the smallest average distance to the 
other nodes and N10 that has the lowest score because it s average distance to other nodes is
the longest.

5. Proximity prestige
Proximity prestige can be used to measure prestige in directed networks. Notable cases include
– N1 that has the highest score because it has the most followers(the most nodes have direct
path to that node) and N10 that has no followers and does not influence anyone.

6. Betweenness centrality
It takes into account the number of shortest paths that pass through it. Notable cases include –
N8 that has the highest score because it has the most shortest paths that pass through it.

7. Common neighbor based centrality
Both – Common neighbor based centrality and Jaccard measure are neighborhood based
methods. It means that they measure the number of common neighbors between a pair of nodes
so it would be possible to determine the likelihood of a link between them in the future.
I counted common neighbors between every node with node N4. The higher the value the bigger
probability for those nodes to connect. Does not take into account the number of other
connections.

8. Jaccard measure
Unlike Common neighbor based centrality, Jaccard measure takes into account the relative
number of common neighbors between them as compared to the number of other connections.
To show difference between Common neighbor based centrality and Jaccard measure then lets
look at the nodes N1, N2, N6 and N7. All of them have 3 common neighbors with node N4 as
shown in the upper table. But N6 and N7 have one neighbor more than N1 and N2 so actually
probability for node N4 to connect with nodes N1 and N2 are bigger than with N6 and N7
although Common neighbor based centrality showed that this is equal.
