library(igraph)
set.seed(3952)

source("kite_graph.R")

lcc = function(mat, i){
  row = mat[i, ]
  size = ncol(mat)
  friends_index = (1:size)[row != 0]
  
  small_mat = mat[friends_index, friends_index]
  print(small_mat)
  
  # count all edges that are non zero, by summing the mask
  # divide by two, to remove repeated edges, like (a, b) and (b, a)
  # subtract the size, to remove the diagonal friends connectivity
  existing_edge_count = sum(small_mat != 0) / 2
  total_edge_count = size * (size - 1) / 2
  
  return(existing_edge_count / total_edge_count)
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  print(i)
  plotting_values[i] = lcc(mat, i)
}
plotting_wrapper(g, plotting_values)

