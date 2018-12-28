library(igraph)
set.seed(3952)

source("kite_graph.R")

common_neighbour = function(a, b, mat) {
  row_a = mat[a, ]
  row_b = mat[b, ]
  common = (row_a * row_b)  != 0

  return(sum(common))
}

total_neighbour = function(a, b, mat) {
  row_a = mat[a, ]
  row_b = mat[b, ]
  common = (row_a + row_b)  != 0

  return(sum(common))
}

jaccard_measure = function(a, b, mat) {
  result = common_neighbour(a, b, mat) / total_neighbour(a, b, mat)
  return(result)
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = jaccard_measure(i, 4, mat)
}
plotting_wrapper(g, plotting_values)
