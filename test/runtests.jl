using SLATEC
using Test

@testset "SLATEC.jl" begin
    @test SLATEC.SLATEC_jll.is_available()

    if VERSION >= v"1.11"
        @testset "Docstrings" begin
            @test isempty(Docs.undocumented_names(SLATEC))
            @test isempty(Docs.undocumented_names(SLATEC.FNLIB))
        end
    end
end

@testset "FNLIB" begin
    include("fnlib.jl")
end
