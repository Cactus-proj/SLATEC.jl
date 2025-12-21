using SLATEC
using Test

@testset "SLATEC.jl" begin
    @test SLATEC.SLATEC_jll.is_available()

    @testset "Docstrings" begin
        @test isempty(Docs.undocumented_names(SLATEC))
    end
end

@testset "FNLIB" begin
    include("fnlib.jl")
end
