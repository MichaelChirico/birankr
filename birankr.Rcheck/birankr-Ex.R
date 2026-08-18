pkgname <- "birankr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "birankr-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('birankr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("bipartite_rank")
### * bipartite_rank

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: bipartite_rank
### Title: Bipartite Ranks
### Aliases: bipartite_rank
### Keywords: BGRM BiRank Bipartite CoHITS HITS centrality rank

### ** Examples

library(data.table)
#create edge list between patients and providers
    df <- data.table(
      patient_id = sample(x = 1:10000, size = 10000, replace = TRUE),
      provider_id = sample(x = 1:5000, size = 10000, replace = TRUE)
    )

#estimate CoHITS ranks
    CoHITS <- bipartite_rank(data = df, normalizer = "CoHITS")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("bipartite_rank", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("br_birank")
### * br_birank

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: br_birank
### Title: BiRanks
### Aliases: br_birank
### Keywords: BiRank Bipartite centrality rank

### ** Examples

library(data.table)
#create edge list between patients and providers
    df <- data.table(
      patient_id = sample(x = 1:10000, size = 10000, replace = TRUE),
      provider_id = sample(x = 1:5000, size = 10000, replace = TRUE)
    )

#estimate BiRank ranks
    BiRank <- br_birank(data = df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("br_birank", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("br_hits")
### * br_hits

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: br_hits
### Title: HITS Ranks
### Aliases: br_hits
### Keywords: Bipartite HITS centrality rank

### ** Examples

library(data.table)
#create edge list between patients and providers
    df <- data.table(
      patient_id = sample(x = 1:10000, size = 10000, replace = TRUE),
      provider_id = sample(x = 1:5000, size = 10000, replace = TRUE)
    )

#estimate HITS ranks
    HITS <- br_hits(data = df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("br_hits", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pagerank")
### * pagerank

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pagerank
### Title: Estimate PageRank
### Aliases: pagerank
### Keywords: Bipartite PageRank centrality rank

### ** Examples

#Prepare one-mode data
    df_one_mode <- data.frame(
      sender = sample(x = 1:10000, size = 10000, replace = TRUE),
      receiver = sample(x = 1:10000, size = 10000, replace = TRUE)
    )

#Add self-loops for all nodes
    unique_ids <- unique(c(df_one_mode$sender, df_one_mode$receiver))
    df_one_mode <- rbind(df_one_mode, data.frame(sender = unique_ids,
    receiver = unique_ids))

#Estimate PageRank in one-mode data
    PageRank <- pagerank(data = df_one_mode, is_bipartite = FALSE)

#Estimate PageRank in two-mode data
    df_two_mode <- data.frame(
      patient_id = sample(x = 1:10000, size = 10000, replace = TRUE),
      provider_id = sample(x = 1:5000, size = 10000, replace = TRUE)
    )
    PageRank <- pagerank(data = df_two_mode)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pagerank", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("project_to_one_mode")
### * project_to_one_mode

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: project_to_one_mode
### Title: Create a one-mode projection of a two mode graph
### Aliases: project_to_one_mode
### Keywords: dgCMatrix matrix

### ** Examples

#make matrix
   my_matrix <- sparseMatrix(i = c(1, 1, 2, 3, 4, 4, 5, 6, 7, 7), 
       j = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), x = 1
   )
#project to one mode
   project_to_one_mode(adj_mat = my_matrix, mode = "rows")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("project_to_one_mode", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sparsematrix_from_edgelist")
### * sparsematrix_from_edgelist

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sparsematrix_from_edgelist
### Title: Convert edge list to sparse matrix
### Aliases: sparsematrix_from_edgelist
### Keywords: dgCMatrix

### ** Examples

#make edge.list
   df <- data.frame(
     id1 = sample(x = 1:20, size = 100, replace = TRUE),
     id2 = sample(x = 1:10, size = 100, replace = TRUE),
     weight = sample(x = 1:10, size = 100, replace = TRUE)
   )
#convert to sparsematrix
   sparsematrix_from_edgelist(data = df)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sparsematrix_from_edgelist", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sparsematrix_from_matrix")
### * sparsematrix_from_matrix

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sparsematrix_from_matrix
### Title: Convert matrix to sparse matrix
### Aliases: sparsematrix_from_matrix
### Keywords: dgCMatrix matrix

### ** Examples

#make matrix
   my_matrix <- rep(0, 100)
   my_matrix[c(1, 11, 22, 33, 44, 54, 65, 76, 87, 97)] <- 1
   my_matrix <- matrix(data = my_matrix, nrow = 10, ncol = 10)
#convert to sparsematrix
   sparsematrix_from_matrix(adj_mat = my_matrix)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sparsematrix_from_matrix", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sparsematrix_rm_weights")
### * sparsematrix_rm_weights

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sparsematrix_rm_weights
### Title: Remove sparse matrix edge weights
### Aliases: sparsematrix_rm_weights
### Keywords: dgCMatrix matrix

### ** Examples

#make matrix
   my_matrix <- sparseMatrix(
       i = c(1, 1, 2, 3, 4, 4, 5, 6, 7, 7), 
       j = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
       x = c(1, 1, 3, 1, 2, 1, 1, 1, 2, 1)
   )
#remove weights
   sparsematrix_rm_weights(my_matrix)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sparsematrix_rm_weights", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
