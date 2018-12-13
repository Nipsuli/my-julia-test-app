module MyTestApp
include(joinpath(@__DIR__, "functions.jl"))

using .Functions

hello() = "Hello"

end  # module MyTestApp
