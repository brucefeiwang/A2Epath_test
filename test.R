# represent the graph in a matrix
graph <- matrix(0,5,5)
rownames(graph) <- c("A","B","C","D","E")
colnames(graph) <- c("A","B","C","D","E")
graph["A","B"] <- 1
graph["A","C"] <- 1
graph["A","E"] <- 1

graph["B","D"] <- 1
graph["B","E"] <- 1

graph["C","E"] <- 1

graph["D","C"] <- 1

paths  <- "A"

for( i in 1:nrow(graph))
{
  for(j in 1:length(paths))
  {
    ends <- colnames(graph  )[graph[substr(paths[j],nchar(paths[j]),nchar(paths[j])),] ==1]
    if(length(ends))
    {
      path_remove <- paths[j]
      paths <-c(paths, paste0(paths[j],ends)  )
      paths <- setdiff(paths, path_remove)
      
    }
  }
}


paths
