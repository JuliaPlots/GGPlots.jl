# GGPlots (WIP)

"Grammar of Graphics in Plots.jl"

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

![](https://cloud.githubusercontent.com/assets/933338/19286443/b4d461ea-8fcb-11e6-9ff1-71bca09f3550.png)
