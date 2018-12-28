library(igraph)
set.seed(3952)

source("kite_graph.R")

# centrality degree
centrality_degree = function(mat, i){
  row = mat[i, ]
  size = ncol(mat)
  friends_count = length((1:size)[row != 0])
  return (friends_count/(size-1))
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = centrality_degree(mat, i)
}
plotting_wrapper(g, plotting_values)
