# GGPlots (WIP)

"Grammar of Graphics in Plots.jl"

Contributors needed!  I'll implement a proof-of-concept, but I need volunteers to make it a full-fledged API.

The idea here is that we utilize some types and multiple dispatch to create Grammar of Grapics (GG) styled operations:

```julia
using GGPlots, RDatasets
pyplot()
theme(:solarized)
iris = dataset("datasets", "iris")

ggplot(iris, :SepalLength, :SepalWidth, leg=false) +
   geom_point(color = :PetalWidth, msw=0) +
   geom_smooth(method = :lm)
```

![](https://cloud.githubusercontent.com/assets/933338/19287888/9dd78994-8fd1-11e6-9e56-e6485cebe6b0.png)
