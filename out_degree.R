library(igraph)
set.seed(3952)

source("kite_graph.R")
g = g_directed
mat = mat_directed

out_dergere = function(mat, i){
  row = mat[i, ]
  size = ncol(mat)
  friends_count = length((1:size)[row != 0])
  return (friends_count/(size-1))
}


plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = out_dergere(mat, i)
}
plotting_wrapper(g, plotting_values)