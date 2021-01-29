##
] add Plots 
] add PyPlot 

##
using Pkg
Pkg.add("Plots")
Pkg.add("PyPlot")

##
using GraphRecipes
using Plots



## 
n = 100
x, y = range(0, 1, length = n), randn(n, 3)

using Plots; pyplot(size = (400, 300))

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