library(igraph)
set.seed(3952)

source("kite_graph.R")

g = g_directed
mat = mat_directed

proximity_prestige = function(g, i){
  # incoming is row, destination is column
  sp = shortest.paths(g, algorithm = "dijkstra", mode="in")
  sp[is.infinite(sp)] = 0
  
  row = sp[i,]
  dist = sum(sp[i,])
  count = length(row[row != 0])
  size = ncol(sp)
  pp = (count / (size - 1)) / (dist / count)
  return(pp)  
}

pp = proximity_prestige(g, 2)
print(pp)

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = proximity_prestige(g, i)
}
plotting_wrapper(g, plotting_values)
