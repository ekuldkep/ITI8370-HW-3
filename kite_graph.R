library(igraph)

g_raw <- graph.famous("Krackhardt_Kite")
mat = as.matrix(as_adj(g_raw))
name_format = function(id){ return(paste("N", id, sep="")) }
rownames(mat) = lapply(1:nrow(mat), name_format)
colnames(mat) = lapply(1:nrow(mat), name_format)

mat_directed = as.matrix(mat)
for(i in 1:nrow(mat)){
  for(j in 1:nrow(mat)){
    print(paste(i, j))
    if (i < j){
      mat_directed[i, j] = 0
    }
  }
}
g_directed = graph.adjacency(mat_directed, mode = "directed")
print("directed")
print(mat_directed)

g = graph.adjacency(mat, mode = "undirected")
print("undirected")
print(mat)

plotting_wrapper = function(g, values){
  print(values)
  green = values
  green[is.nan(green)] = 0
  green = green - min(green)
  # mark the highest score
  max_mask = green == max(green)
  green[max_mask] = 0
  if (max(green) != 0){
    green = green / max(green)
  }
  green[max_mask] = 1
  red = max_mask
  
  V(g)$label.cex <- 0.9
  V(g)$frame.color <- NA
  V(g)$color = rgb(red, green, 0)
  plot(g, layout = layout.fruchterman.reingold, vertex.label.dist=2.2)
}
