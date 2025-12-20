
@testset "FNLIB Float32 Tests" begin

    @testset "cbrt" begin
        @test SLATEC.FNLIB.cbrt(27.0f0) == 3.0f0
        @test SLATEC.FNLIB.cbrt(-27.0f0) == -3.0f0
    end

    @testset "exprel" begin
        # ((e^x) - 1) / x
        # x -> 0, limit is 1
        @test SLATEC.FNLIB.exprel(1.0f-5) ≈ 1.000005f0 atol=1e-4
        @test SLATEC.FNLIB.exprel(1.0f0) ≈ (exp(1.0f0) - 1.0f0) / 1.0f0
    end

    @testset "alnrel" begin
        # ln(1 + x)
        @test SLATEC.FNLIB.alnrel(0.0f0) ≈ 0.0f0
        @test SLATEC.FNLIB.alnrel(exp(1.0f0) - 1.0f0) ≈ 1.0f0
    end

    @testset "r9ln2r" begin
        # (ln(1 + x) - x + x^2/2) / x^3
        # Test with small x
        x = 0.1f0
        expected = (log(1+x) - x + x^2/2) / x^3
        @test SLATEC.FNLIB.r9ln2r(x) ≈ expected rtol=1e-4
    end

    @testset "cot" begin
        @test SLATEC.FNLIB.cot(Float32(pi)/4) ≈ 1.0f0
        @test SLATEC.FNLIB.cot(Float32(pi)/2) ≈ 0.0f0 atol=1e-6
    end

    @testset "sindg" begin
        @test SLATEC.FNLIB.sindg(30.0f0) ≈ 0.5f0
        @test SLATEC.FNLIB.sindg(90.0f0) ≈ 1.0f0
        @test SLATEC.FNLIB.sindg(0.0f0) ≈ 0.0f0
    end

    @testset "cosdg" begin
        @test SLATEC.FNLIB.cosdg(60.0f0) ≈ 0.5f0
        @test SLATEC.FNLIB.cosdg(0.0f0) ≈ 1.0f0
        @test SLATEC.FNLIB.cosdg(90.0f0) ≈ 0.0f0 atol=1e-6
    end

    @testset "asinh" begin
        @test SLATEC.FNLIB.asinh(0.0f0) ≈ 0.0f0
        @test SLATEC.FNLIB.asinh(sinh(1.0f0)) ≈ 1.0f0
    end

    @testset "acosh" begin
        @test SLATEC.FNLIB.acosh(1.0f0) ≈ 0.0f0
        @test SLATEC.FNLIB.acosh(cosh(1.0f0)) ≈ 1.0f0
    end

    @testset "atanh" begin
        @test SLATEC.FNLIB.atanh(0.0f0) ≈ 0.0f0
        @test SLATEC.FNLIB.atanh(tanh(1.0f0)) ≈ 1.0f0
    end

    @testset "r9atn1" begin
        # (arctan(x) - x) / x^3
        x = 0.1f0
        expected = (atan(x) - x) / x^3
        @test SLATEC.FNLIB.r9atn1(x) ≈ expected rtol=1e-4
    end

    @testset "ei" begin
        # Exponential integral Ei(x)
        # Ei(x) for x > 0
        @test SLATEC.FNLIB.ei(1.0f0) ≈ 1.895117816f0 rtol=1e-5
    end

    @testset "e1" begin
        # Exponential integral E1(x)
        # E1(1.0) approx 0.219383934
        @test SLATEC.FNLIB.e1(1.0f0) ≈ 0.219383934f0 rtol=1e-5
    end

    @testset "ali" begin
        # Logarithmic integral li(x)
        # li(e) approx 1.895117816
        @test SLATEC.FNLIB.ali(exp(1.0f0)) ≈ 1.895117816f0 rtol=1e-5
    end

    @testset "fac" begin
        @test SLATEC.FNLIB.fac(Int32(5)) ≈ 120.0f0
        @test SLATEC.FNLIB.fac(Int32(0)) ≈ 1.0f0
    end

    @testset "binom" begin
        @test SLATEC.FNLIB.binom(Int32(5), Int32(2)) ≈ 10.0f0
    end

    @testset "gamma" begin
        @test SLATEC.FNLIB.gamma(5.0f0) ≈ 24.0f0
        @test SLATEC.FNLIB.gamma(0.5f0) ≈ sqrt(Float32(pi))
    end

    @testset "gamr" begin
        @test SLATEC.FNLIB.gamr(5.0f0) ≈ 1.0f0 / 24.0f0
    end

    @testset "alngam" begin
        @test SLATEC.FNLIB.alngam(5.0f0) ≈ log(24.0f0)
    end

    @testset "gami" begin
        # Incomplete gamma
        @test SLATEC.FNLIB.gami(1.0f0, 1.0f0) ≈ 1.0f0 - exp(-1.0f0) rtol=1e-5
    end

    @testset "gamic" begin
        # Complementary incomplete gamma
        @test SLATEC.FNLIB.gamic(1.0f0, 1.0f0) ≈ exp(-1.0f0) rtol=1e-5
    end

    @testset "gamit" begin
        # Tricomi's incomplete gamma
        # gamma*(a,x) = x^-a * P(a,x) / gamma(a) ? No, formula says x^-a * incomplete gamma(a,x) / gamma(a)
        # For a=1, gamma(1)=1. gamma*(1,x) = x^-1 * (1-exp(-x))
        x = 1.0f0
        expected = (1.0f0/x) * (1.0f0 - exp(-x))
        @test SLATEC.FNLIB.gamit(1.0f0, x) ≈ expected rtol=1e-5
    end

    @testset "psi" begin
        # digamma(1) = -gamma_euler
        @test SLATEC.FNLIB.psi(1.0f0) ≈ -0.57721566f0 rtol=1e-5
    end

    @testset "poch" begin
        # poch(a, x) = gamma(a+x)/gamma(a)
        @test SLATEC.FNLIB.poch(1.0f0, 5.0f0) ≈ 120.0f0 # 5!
    end

    @testset "poch1" begin
        # ((a)_x - 1) / x
        # For a=1, x=1: (1)_1 = 1. (1-1)/1 = 0
        # For a=1, x=2: (1)_2 = 1*2=2. (2-1)/2 = 0.5
        @test SLATEC.FNLIB.poch1(1.0f0, 2.0f0) ≈ 0.5f0
    end

    @testset "beta" begin
        @test SLATEC.FNLIB.beta(1.0f0, 1.0f0) ≈ 1.0f0
        @test SLATEC.FNLIB.beta(2.0f0, 3.0f0) ≈ 1.0f0/12.0f0 rtol=1e-5 # 1!*2!/4! = 2/24 = 1/12
    end

    @testset "albeta" begin
        @test SLATEC.FNLIB.albeta(2.0f0, 3.0f0) ≈ log(1.0f0/12.0f0) rtol=1e-5
    end

    @testset "betai" begin
        # Incomplete beta ratio Ix(a,b)
        # Ix(a,b) for x=1 is 1
        @test SLATEC.FNLIB.betai(1.0f0, 2.0f0, 3.0f0) ≈ 1.0f0
        # Ix(a,b) for x=0 is 0
        @test SLATEC.FNLIB.betai(0.0f0, 2.0f0, 3.0f0) ≈ 0.0f0
    end

    @testset "r9lgmc" begin
        # Log gamma correction term
        # Check continuity or specific value if known. 
        # For large x, it approaches 0?
        # Formula: ln gamma(x) - (ln(2pi)/2) - (x-0.5)ln(x) + x
        # This is Stirling's approximation error term.
        x = 10.0f0
        lhs = log(SLATEC.FNLIB.gamma(x))
        rhs = (log(2*pi)/2) + (x-0.5)*log(x) - x + SLATEC.FNLIB.r9lgmc(x)
        @test lhs ≈ rhs
    end

    @testset "erf" begin
        @test SLATEC.FNLIB.erf(0.0f0) ≈ 0.0f0
        # erf(infinity) -> 1
        @test SLATEC.FNLIB.erf(3.0f0) ≈ 0.9999779f0 atol=1e-5
    end

    @testset "erfc" begin
        @test SLATEC.FNLIB.erfc(0.0f0) ≈ 1.0f0
        @test SLATEC.FNLIB.erfc(3.0f0) ≈ (1.0f0 - 0.9999779f0) atol=1e-5
    end

    @testset "daws" begin
        @test SLATEC.FNLIB.daws(0.0f0) ≈ 0.0f0
    end

    @testset "besj0" begin
        @test SLATEC.FNLIB.besj0(0.0f0) ≈ 1.0f0
    end

    @testset "besj1" begin
        @test SLATEC.FNLIB.besj1(0.0f0) ≈ 0.0f0
    end

    @testset "besy0" begin
        # Y0(x) -> -infinity as x -> 0
        @test SLATEC.FNLIB.besy0(1.0f0) ≈ 0.08825696f0 rtol=1e-5
    end

    @testset "besy1" begin
        @test SLATEC.FNLIB.besy1(1.0f0) ≈ -0.7812128f0 rtol=1e-5
    end

    @testset "besi0" begin
        @test SLATEC.FNLIB.besi0(0.0f0) ≈ 1.0f0
    end

    @testset "besi1" begin
        @test SLATEC.FNLIB.besi1(0.0f0) ≈ 0.0f0
    end

    @testset "besk0" begin
        # K0(x) -> infinity as x -> 0
        @test SLATEC.FNLIB.besk0(1.0f0) ≈ 0.42102444f0 rtol=1e-5
    end

    @testset "besk1" begin
        @test SLATEC.FNLIB.besk1(1.0f0) ≈ 0.60190725f0 rtol=1e-5
    end

    @testset "besi0e" begin
        # exp(-|x|) * I0(x)
        @test SLATEC.FNLIB.besi0e(0.0f0) ≈ 1.0f0
    end

    @testset "besi1e" begin
        @test SLATEC.FNLIB.besi1e(0.0f0) ≈ 0.0f0
    end

    @testset "besk0e" begin
        # exp(x) * K0(x)
        @test SLATEC.FNLIB.besk0e(1.0f0) ≈ exp(1.0f0) * 0.42102444f0 rtol=1e-5
    end

    @testset "besk1e" begin
        @test SLATEC.FNLIB.besk1e(1.0f0) ≈ exp(1.0f0) * 0.60190725f0 rtol=1e-5
    end

    @testset "ai" begin
        # Airy Ai(0) = 1 / (3^(2/3) * gamma(2/3)) approx 0.355028
        @test SLATEC.FNLIB.ai(0.0f0) ≈ 0.35502805f0 rtol=1e-5
    end

    @testset "bi" begin
        # Airy Bi(0) = 1 / (3^(1/6) * gamma(2/3)) approx 0.6149266
        @test SLATEC.FNLIB.bi(0.0f0) ≈ 0.6149266f0 rtol=1e-5
    end

    @testset "aie" begin
        # Scaled Ai
        @test SLATEC.FNLIB.aie(0.0f0) ≈ 0.35502805f0 rtol=1e-5
    end

    @testset "bie" begin
        # Scaled Bi
        @test SLATEC.FNLIB.bie(0.0f0) ≈ 0.6149266f0 rtol=1e-5
    end

    @testset "chu" begin
        # U(a,b,x)
        # U(a,b,x) for a=0 is 1
        @test SLATEC.FNLIB.chu(0.0f0, 1.0f0, 10.0f0) ≈ 1.0f0
    end

    @testset "spenc" begin
        # Spence dilogarithm s(x)
        # s(1) = pi^2 / 6 approx 1.644934
        @test SLATEC.FNLIB.spenc(1.0f0) ≈ 1.644934f0 rtol=1e-5
    end

end