Various R functions to help with analyses using Shannon's information theory and graph theory.

Functions:

`CoordCMDS`: classical multidimensional scaling from distance matrix

`genJSD`: generalized Jensen-Shannon divergence

`MakeDistMatrix`: distance matrix from `data.table`

`MakeNonRedundantPairs`: helps with pairwise combinatorial analyses of stuff

`RadialNudge`: for visualizing multiple 'shells' of nodes in a circular graph

Installation
============

If you don't already have `devtools`:

    install.packages("devtools")

Install:

    library(devtools)
    install_github("wkc1986/infograf")

Use:

    library(infograf)
