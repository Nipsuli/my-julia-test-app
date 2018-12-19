using Test
include(joinpath(@__DIR__, "..", "src", "functions.jl"))


function test_functions()

    @testset "test functions" begin
        @test Functions.f() == π
        @test Functions.add(1, 2) == 3
    end

end
