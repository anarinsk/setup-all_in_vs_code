## julia> ] 
## pkg> add InstantiateFromURL

## Before Instantiate Prjoect, change directory 
## julia> cd("github-anari/setup-all_in_vs_code")
## julia> pwd()
## `https://julialang.github.io/Pkg.jl/v1/environments/#Using-someone-else's-project`

using InstantiateFromURL
github_project("QuantEcon/quantecon-notebooks-julia", version = "0.8.0", instantiate = true, precompile = true)

##
using Pkg
#Pkg.add("Plots")
Pkg.add("PyPlot")
Pkg.add("UnicodePlots")

## Plot by using pyplot 
n = 100
x, y = range(0, 1, length = n), randn(n, 3)

using Plots; 
pyplot(size = (600, 300))

plot(
    x, y,
    line = (0.5, [4 1 0], [:path :scatter :histogram]),
    normalize = true,
    bins = 30,
    marker = (10, 0.5, [:none :+ :none]),
    markerstrokewidth = 0,
    color = [:steelblue :orangered :green],
    fill = 0.5,
    orientation = [:v :v :h],
    title = "My title",
)

##
plot(Plots.fakedata(50, 5), w = 3)

##
y = rand(100)
plot(0:10:100, rand(11, 4), lab = "lines", w = 3, palette = cgrad(:grays), fill = 0, α = 0.6)
scatter!(y, zcolor = abs.(y .- 0.5), m = (:heat, 0.8, Plots.stroke(1, :green)), ms = 10 * abs.(y .- 0.5) .+ 4, lab = "grad")

##
using Random
Random.seed!(111)
plot!(Plots.fakedata(100, 10))

##
n = 100
ts = range(0, stop = 8π, length = n)
x = ts .* map(cos, ts)
y = (0.1ts) .* map(sin, ts)
z = 1:n
plot(x, y, z, zcolor = reverse(z), m = (10, 0.8, :blues, Plots.stroke(0)), leg = false, cbar = true, w = 5)
plot!(zeros(n), zeros(n), 1:n, w = 10)

##
using Plots
pyplot(size = (600, 300))

group = rand(map((i->begin
                    "group $(i)"
                end), 1:4), 100)
plot(rand(100), layout = @layout([a b; c]), group = group, linetype = [:bar :scatter :steppre], linecolor = :match, size=(700, 500))

##
using Plots
#using Pkg 
#Pkg.add("UnicodePlots")
unicodeplots()

plot(Plots.fakedata(50,5),w=3)
histogram(randn(1000),nbins=50)