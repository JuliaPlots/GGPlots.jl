__precompile__(true)

module GGPlots

using Reexport
@reexport using StatPlots
@reexport using DataFrames
import Base: +

export
    ggplot,
    geom_point,
    geom_smooth

# -------------------------------------------------------------------------
# geoms

abstract Geom

const _point_keys = KW(:color => :marker_z)
immutable Point <: Geom
    kw::KW
end
function Point(; kw...)
    g = Point(KW(:seriestype => :scatter))
    for (k,v) in kw
        g.kw[get(_point_keys, k, k)] = v
    end
    g
end
const geom_point = Point

const _smooth_keys = KW(:method => :smooth)
const _smooth_vals = KW(:lm => true)
immutable Smooth <: Geom
    kw::KW
end
function Smooth(; kw...)
    g = Smooth(KW())
    for (k,v) in kw
        g.kw[get(_smooth_keys, k, k)] = get(_smooth_vals, v, v)
    end
    g
end
const geom_smooth = Smooth

# -------------------------------------------------------------------------
# ggplot

immutable GGPlot
    df::AbstractDataFrame
    args::Tuple
    kw::KW
end
function ggplot(df::AbstractDataFrame, args...; kw...)
    GGPlot(df, args, KW(kw))
end

function +(gg::GGPlot, geom::Geom)
    merge!(gg.kw, geom.kw)
    gg
end

StatPlots.plot(gg::GGPlot) = plot(gg.df, gg.args...; gg.kw...)
Base.display(gg::GGPlot) = display(plot(gg))


end # module
