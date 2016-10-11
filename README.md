# GGPlots (WIP)

Contributors needed!  I'll implement a proof-of-concept, but I need volunteers to make it a full-fledged API.

The idea here is that we utilize some types and multiple dispatch to create Grammar of Grapics (GG) styled operations:

```julia
using GGPlots, RDatasets
pyplot()
iris = dataset("datasets", "iris")

ggplot(iris, aes(:SepalLength, :SepalWidth)) +
    geom_point(aes(color = :PetalWidth)) +
    geom_smooth(method = :lm)
```
