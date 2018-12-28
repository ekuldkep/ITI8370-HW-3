library(igraph)
set.seed(3952)

source("kite_graph.R")

closeness_centrality = function(g, i){
  # distances show how many jumps there are to the other node
  # D = distances(g)
  shortest = shortest.paths(g, algorithm = "dijkstra")
  size = ncol(shortest)
  distance_sum = sum(shortest[i, ])
  average_dist = distance_sum/(size - 1)
  return(1/average_dist)
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = closeness_centrality(g, i)
}
plotting_wrapper(g, plotting_values)
