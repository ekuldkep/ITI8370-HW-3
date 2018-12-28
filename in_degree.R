library(igraph)
set.seed(3952)

source("kite_graph.R")
g = g_directed
mat = mat_directed

in_degree = function(mat, i){
  column = mat[, i]
  size = nrow(mat)
  friends_count = length((1:size)[column != 0])
  return (friends_count/(size-1))
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = in_degree(mat, i)
}
plotting_wrapper(g, plotting_values)