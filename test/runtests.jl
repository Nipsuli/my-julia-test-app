using Test
include(joinpath(@__DIR__, "..", "src", "MyTestApp.jl"))


function run_tests()

    @testset "test random stuff" begin
        @test [1, 2] + [2, 1] == [3, 3]
    end

    @testset "test functions" begin
        @test MyTestApp.Functions.f() == π
        @test MyTestApp.Functions.add(1, 2) == 3
    end

end

run_tests()
