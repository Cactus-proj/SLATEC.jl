using SLATEC
using Test

@testset "SLATEC.jl" begin
    @test SLATEC.SLATEC_jll.is_available()
end

@testset "fnlib.jl" begin
    include("fnlib.jl")
end
