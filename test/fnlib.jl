
const FN = SLATEC.FNLIB

@testset "Type $T" for T in (Float32, Float64)
    @testset "cbrt" begin
        @test FN.cbrt(T(27.0)) == T(3.0)
        @test FN.cbrt(T(-27.0)) == T(-3.0)
    end

    @testset "exprel" begin
        # ((e^x) - 1) / x
        # x -> 0, limit is 1
        @test FN.exprel(T(1e-5)) ≈ T(1.000005) atol=1e-4
        @test FN.exprel(T(1.0)) ≈ (exp(T(1.0)) - T(1.0)) / T(1.0)
    end

    @testset "alnrel" begin
        # ln(1 + x)
        @test FN.alnrel(T(0.0)) ≈ T(0.0)
        @test FN.alnrel(exp(T(1.0)) - T(1.0)) ≈ T(1.0)
    end

    @testset "r9ln2r" begin
        # (ln(1 + x) - x + x^2/2) / x^3
        # Test with small x
        x = T(0.1)
        expected = (log(1+x) - x + x^2/2) / x^3
        @test FN.r9ln2r(x) ≈ expected rtol=1e-4
    end

    @testset "cot" begin
        @test FN.cot(T(pi)/4) ≈ T(1.0)
        @test FN.cot(T(pi)/2) ≈ T(0.0) atol=1e-6
    end

    @testset "sindg" begin
        @test FN.sindg(T(30.0)) ≈ T(0.5)
        @test FN.sindg(T(90.0)) ≈ T(1.0)
        @test FN.sindg(T(0.0)) ≈ T(0.0)
    end

    @testset "cosdg" begin
        @test FN.cosdg(T(60.0)) ≈ T(0.5)
        @test FN.cosdg(T(0.0)) ≈ T(1.0)
        @test FN.cosdg(T(90.0)) ≈ T(0.0) atol=1e-6
    end

    @testset "asinh" begin
        @test FN.asinh(T(0.0)) ≈ T(0.0)
        @test FN.asinh(sinh(T(1.0))) ≈ T(1.0)
    end

    @testset "acosh" begin
        @test FN.acosh(T(1.0)) ≈ T(0.0)
        @test FN.acosh(cosh(T(1.0))) ≈ T(1.0)
    end

    @testset "atanh" begin
        @test FN.atanh(T(0.0)) ≈ T(0.0)
        @test FN.atanh(tanh(T(1.0))) ≈ T(1.0)
    end

    @testset "r9atn1" begin
        # (arctan(x) - x) / x^3
        x = T(0.1)
        expected = (atan(x) - x) / x^3
        @test FN.r9atn1(x) ≈ expected rtol=1e-4
    end

    @testset "ei" begin
        @test FN.ei(T(1.0)) ≈ T(1.895117816) rtol=1e-5
    end

    @testset "e1" begin
        @test FN.e1(T(1.0)) ≈ T(0.219383934) rtol=1e-5
    end

    @testset "ali" begin
        # Logarithmic integral li(x)
        @test FN.ali(exp(T(1.0))) ≈ T(1.895117816) rtol=1e-5
    end

    @testset "fac" begin
        @test FN.fac(Int32(5), T) ≈ T(120.0)
        @test FN.fac(Int32(0), T) ≈ T(1.0)
    end

    @testset "binom" begin
        @test FN.binom(Int32(5), Int32(2), T) ≈ T(10.0)
    end

    @testset "gamma" begin
        @test FN.gamma(T(5.0)) ≈ T(24.0)
        @test FN.gamma(T(0.5)) ≈ sqrt(T(pi))
    end

    @testset "gamlim" begin
        xmin, xmax = FN.gamlim(T)
        @test xmin < 0 && xmax > 0
    end

    @testset "gamr" begin
        @test FN.gamr(T(5.0)) ≈ T(1.0) / T(24.0)
    end

    @testset "alngam" begin
        @test FN.alngam(T(5.0)) ≈ log(T(24.0))
    end

    @testset "algams" begin
        loggam, sgn = FN.algams(T(5.0))
        @test loggam ≈ log(T(24.0))
        @test sgn ≈ T(1.0)
    end

    @testset "gami" begin
        @test FN.gami(T(1.0), T(1.0)) ≈ T(1.0) - exp(T(-1.0)) rtol=1e-5
    end

    @testset "gamic" begin
        @test FN.gamic(T(1.0), T(1.0)) ≈ exp(T(-1.0)) rtol=1e-5
    end

    @testset "gamit" begin
        # Tricomi's incomplete gamma
        # gamma*(a,x) = x^-a * P(a,x) / gamma(a) ? No, formula says x^-a * incomplete gamma(a,x) / gamma(a)
        # For a=1, gamma(1)=1. gamma*(1,x) = x^-1 * (1-exp(-x))
        x = T(1.0)
        expected = (T(1.0)/x) * (T(1.0) - exp(-x))
        @test FN.gamit(T(1.0), x) ≈ expected rtol=1e-5
    end

    @testset "psi" begin
        # digamma(1) = -gamma_euler
        @test FN.psi(T(1.0)) ≈ T(-0.57721566) rtol=1e-5
    end

    @testset "poch" begin
        # poch(a, x) = gamma(a+x)/gamma(a)
        @test FN.poch(T(1.0), T(5.0)) ≈ T(120.0) # 5!
    end

    @testset "poch1" begin
        # ((a)_x - 1) / x
        # For a=1, x=1: (1)_1 = 1. (1-1)/1 = 0
        # For a=1, x=2: (1)_2 = 1*2=2. (2-1)/2 = 0.5
        @test FN.poch1(T(1.0), T(2.0)) ≈ T(0.5)
    end

    @testset "beta" begin
        @test FN.beta(T(1.0), T(1.0)) ≈ T(1.0)
        # 1!*2!/4! = 2/24 = 1/12
        @test FN.beta(T(2.0), T(3.0)) ≈ T(1.0)/12.0 rtol=1e-5
    end

    @testset "albeta" begin
        @test FN.albeta(T(2.0), T(3.0)) ≈ log(T(1.0)/12.0) rtol=1e-5
    end

    @testset "betai" begin
        # Ix(a,b) for x=1 is 1
        @test FN.betai(T(1.0), T(2.0), T(3.0)) ≈ T(1.0)
        # Ix(a,b) for x=0 is 0
        @test FN.betai(T(0.0), T(2.0), T(3.0)) ≈ T(0.0)
    end

    @testset "r9lgmc" begin
        # Formula: ln gamma(x) - (ln(2pi)/2) - (x-0.5)ln(x) + x
        x = T(10.0)
        lhs = log(FN.gamma(x))
        rhs = (log(2*T(pi))/2) + (x-0.5)*log(x) - x + FN.r9lgmc(x)
        @test lhs ≈ rhs
    end

    @testset "erf" begin
        @test FN.erf(T(0.0)) ≈ T(0.0)
        # erf(infinity) -> 1
        @test FN.erf(T(3.0)) ≈ T(0.9999779) atol=1e-5
    end

    @testset "erfc" begin
        @test FN.erfc(T(0.0)) ≈ T(1.0)
        @test FN.erfc(T(3.0)) ≈ (T(1.0) - T(0.9999779)) atol=1e-5
    end

    @testset "daws" begin
        @test FN.daws(T(0.0)) ≈ T(0.0)
    end

    @testset "besj0" begin
        @test FN.besj0(T(0.0)) ≈ T(1.0)
    end

    @testset "besj1" begin
        @test FN.besj1(T(0.0)) ≈ T(0.0)
    end

    @testset "besy0" begin
        @test FN.besy0(T(1.0)) ≈ T(0.08825696) rtol=1e-5
    end

    @testset "besy1" begin
        @test FN.besy1(T(1.0)) ≈ T(-0.7812128) rtol=1e-5
    end

    @testset "besi0" begin
        @test FN.besi0(T(0.0)) ≈ T(1.0)
    end

    @testset "besi1" begin
        @test FN.besi1(T(0.0)) ≈ T(0.0)
    end

    @testset "besk0" begin
        @test FN.besk0(T(1.0)) ≈ T(0.42102444) rtol=1e-5
    end

    @testset "besk1" begin
        @test FN.besk1(T(1.0)) ≈ T(0.60190725) rtol=1e-5
    end

    @testset "besi0e" begin
        @test FN.besi0e(T(0.0)) ≈ T(1.0)
    end

    @testset "besi1e" begin
        @test FN.besi1e(T(0.0)) ≈ T(0.0)
    end

    @testset "besk0e" begin
        @test FN.besk0e(T(1.0)) ≈ exp(T(1.0)) * T(0.42102444) rtol=1e-5
    end

    @testset "besk1e" begin
        @test FN.besk1e(T(1.0)) ≈ exp(T(1.0)) * T(0.60190725) rtol=1e-5
    end

    @testset "ai" begin
        # Airy Ai(0) = 1 / (3^(2/3) * gamma(2/3)) approx 0.355028
        @test FN.ai(T(0.0)) ≈ T(0.35502805) rtol=1e-5
    end

    @testset "bi" begin
        # Airy Bi(0) = 1 / (3^(1/6) * gamma(2/3)) approx 0.6149266
        @test FN.bi(T(0.0)) ≈ T(0.6149266) rtol=1e-5
    end

    @testset "aie" begin
        @test FN.aie(T(0.0)) ≈ T(0.35502805) rtol=1e-5
    end

    @testset "bie" begin
        @test FN.bie(T(0.0)) ≈ T(0.6149266) rtol=1e-5
    end

    @testset "chu" begin
        # U(a,b,x) for a=0 is 1
        @test FN.chu(T(0.0), T(1.0), T(10.0)) ≈ T(1.0)
    end

    @testset "spenc" begin
        # s(1) = pi^2 / 6 approx 1.644934
        @test FN.spenc(T(1.0)) ≈ T(1.644934) rtol=1e-5
    end
end

@testset "Type $T" for T in (ComplexF32, )

    @testset "cbrt" begin
        @test FN.cbrt(T(27.0)) ≈ T(3.0)
        x = T(1.0 + 1.0im)
        @test FN.cbrt(x)^3 ≈ x rtol=1e-5
    end

    @testset "exprel" begin
        x = T(1)
        expected = (exp(x) - 1) / x
        @test FN.exprel(x) ≈ expected
    end

    @testset "alnrel" begin
        x = T(0.1 + 0.1im)
        expected = log(1 + x)
        @test FN.alnrel(x) ≈ expected rtol=1e-5
    end

    @testset "r9ln2r" begin
        x = T(1.0)
        expected = (log(1+x) - x + x^2/2) / x^3
        @test FN.r9ln2r(x) ≈ expected
    end

    @testset "cot" begin
        x = T(0.5 + 0.5im)
        expected = cos(x) / sin(x)
        @test FN.cot(x) ≈ expected rtol=1e-5
    end

    @testset "asinh" begin
        x = T(0.5 + 0.5im)
        @test FN.asinh(x) ≈ asinh(x) rtol=1e-5
    end

    @testset "acosh" begin
        x = T(1.5 + 0.5im)
        @test FN.acosh(x) ≈ acosh(x) rtol=1e-5
    end

    @testset "atanh" begin
        x = T(0.5 + 0.1im)
        @test FN.atanh(x) ≈ atanh(x) rtol=1e-5
    end

    @testset "gamma" begin
        z = T(1.5 + 0.5im)
        @test FN.gamma(z+1) ≈ z * FN.gamma(z) rtol=1e-5
    end

    @testset "gamr" begin
        z = T(1.5 + 0.5im)
        @test FN.gamr(z) ≈ 1/FN.gamma(z) rtol=1e-5
    end

    @testset "alngam" begin
        z = T(1.5 + 0.5im)
        @test exp(FN.alngam(z)) ≈ FN.gamma(z) rtol=1e-5
    end

    @testset "psi" begin
        z = T(1.5 + 0.5im)
        @test FN.psi(z+1) ≈ FN.psi(z) + 1/z rtol=1e-5
    end

    @testset "beta" begin
        a = T(1.0 + 0.5im)
        b = T(2.0 + 0.5im)
        expected = FN.gamma(a) * FN.gamma(b) / FN.gamma(a+b)
        @test FN.beta(a, b) ≈ expected rtol=1e-5
    end

    @testset "albeta" begin
        a = T(1.0 + 0.5im)
        b = T(2.0 + 0.5im)
        @test exp(FN.albeta(a, b)) ≈ FN.beta(a, b) rtol=1e-5
    end

    @testset "r9lgmc" begin
        x = T(10.0 + 1.0im)
        lhs = log(FN.gamma(x))
        rhs = (log(2*T(pi))/2) + (x-0.5)*log(x) - x + FN.r9lgmc(x)
        @test exp(lhs) ≈ exp(rhs) rtol=1e-4
    end
end
