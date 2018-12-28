library(igraph)
set.seed(3952)

source("kite_graph.R")

in_between_fraction = function(start, end, between, g){
  shortest_paths = get.all.shortest.paths(g, start, end, mode="all")[[1]]
  # convert shortest path thing into a list of strings paths,like: [["N5" "N4" "N3"], ["N5" "N2" "N3"]]
  cleaned_shortest_paths = lapply(shortest_paths, names)
  # transform this into a list of True/False of "N2" being in sublist
  contains_cleaned_shortest_paths = lapply(cleaned_shortest_paths, function(row) between %in% row)
  # do some magic to count all the True sublist
  between_count = sum(unlist(contains_cleaned_shortest_paths))

  return(between_count/length(shortest_paths))
}

betweenness_centrality = function(g, between){
  node_names = V(g)$name
  node_name_count = length(node_names)
  total_sum = 0
  for (k in 1:node_name_count){
    for (j in 1:k){
      start = node_names[j]
      end = node_names[k]
      result = in_between_fraction(start, end, between, g)
      total_sum = total_sum + result
    }
  }
  size = node_name_count
  pair_count = size * (size - 1) / 2
  return(total_sum / pair_count)
}

plotting_values = matrix(0, nrow=1, ncol=ncol(mat))
for (i in 1:nrow(mat)){
  plotting_values[i] = betweenness_centrality(g, colnames(mat)[i])
}
plotting_wrapper(g, plotting_values)
