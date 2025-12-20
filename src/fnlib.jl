# SPDX-License-Identifier: MIT
# Reading from: docs/capi/fnlib.h
module FNLIB

using SLATEC_jll
const libslatec = SLATEC_jll.libslatec

#= --- Intrinsic Functions and Fundamental Functions --- =#

"""
Unpack a floating point number X so that `X = Y * 2^N`,
where `Y` is between 0.5 and 1.0.

Fortran Name: `R9UPAK(X`, `Y`, `N)`, `D9UPAK(X`, `Y`, `N)`
@param[in]  x  Input floating point number
@param[out] y  Mantissa
@param[out] n  Exponent
"""
function r9upak(x::Float32)
    y, n = Ref{Float32}(NaN32), Ref{Int32}(0)
    ccall((:r9upak_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}),
        x, y, n)
    y[], n[]
end

"""
Unpack a floating point number X so that `X = Y * 2^N`,
where `Y` is between 0.5 and 1.0.

Fortran Name: `R9UPAK(X`, `Y`, `N)`, `D9UPAK(X`, `Y`, `N)`
@param[in]  x  Input floating point number
@param[out] y  Mantissa
@param[out] n  Exponent
"""
function d9upak(x::Float64)
    y, n = Ref{Float64}(NaN), Ref{Int32}(0)
    ccall((:d9upak_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}),
        x, y, n)
    y[], n[]
end

"""
Pack a base 2 exponent into a floating point number.

Fortran Name: `R9PAK(Y`, `N)`, `D9PAK(Y`, `N)`
@param[in]  y  Mantissa
@param[in]  n  Exponent
@return        Packed floating point number
"""
function r9pak(y::Float32, n::Int32)
    ccall((:r9pak_, libslatec), Cfloat, (Ref{Float32}, Ref{Int32}), y, n)
end

"""
Pack a base 2 exponent into a floating point number.

Fortran Name: `R9PAK(Y`, `N)`, `D9PAK(Y`, `N)`
@param[in]  y  Mantissa
@param[in]  n  Exponent
@return        Packed floating point number
"""
function d9pak(y::Float64, n::Int32)
    ccall((:d9pak_, libslatec), Cdouble, (Ref{Float64}, Ref{Int32}), y, n)
end

"""
Determine the number of terms needed in an orthogonal
polynomial series so that it meets a specified accuracy.

Fortran Name: `INITS(OS`, `NOS`, `ETA)`, `INITDS(OS`, `NOS`, `ETA)`
@param[in]  os   Coefficients in an orthogonal series.
@param[in]  nos  Number of coefficients in `os`.
@param[in]  eta  Requested accuracy of the series.
@return          Number of terms needed to meet the accuracy.
"""
function inits(os::Vector{Float32}, eta::Float32)
    ccall((:inits_, libslatec), Cint, (Ptr{Cfloat}, Ref{Cint}, Ref{Cfloat}),
        os, Ref(Cint(length(os))), Ref(eta))
end

"""
Determine the number of terms needed in an orthogonal
polynomial series so that it meets a specified accuracy.

Fortran Name: `INITS(OS`, `NOS`, `ETA)`, `INITDS(OS`, `NOS`, `ETA)`
@param[in]  os   Coefficients in an orthogonal series.
@param[in]  nos  Number of coefficients in `os`.
@param[in]  eta  Requested accuracy of the series.
@return          Number of terms needed to meet the accuracy.
"""
function initds(os::Vector{Float64}, eta::Float64)
    ccall((:initds_, libslatec), Cint, (Ptr{Cdouble}, Ref{Cint}, Ref{Cdouble}),
        os, Ref(Cint(length(os))), Ref(eta))
end

"""
Evaluate Chebyshev series.

Formula: `summation for i = 1 to n of cs(i)*(2*x)**(i-1)`

Fortran Name: `CSEVL(X`, `CS`, `N)`, `DCSEVL(X`, `CS`, `N)`
@param[in]  x  Input value
@param[in]  cs Coefficients in the Chebyshev series.
@param[in]  n  Number of coefficients in `cs`.
@return        Value of the Chebyshev series at `x`.
"""
function csevl()
    ccall((:csevl_, libslatec), Cfloat, (), )
end

"""
Evaluate Chebyshev series.

Formula: `summation for i = 1 to n of cs(i)*(2*x)**(i-1)`

Fortran Name: `CSEVL(X`, `CS`, `N)`, `DCSEVL(X`, `CS`, `N)`
@param[in]  x  Input value
@param[in]  cs Coefficients in the Chebyshev series.
@param[in]  n  Number of coefficients in `cs`.
@return        Value of the Chebyshev series at `x`.
"""
function dcsevl()
    ccall((:dcsevl_, libslatec), Cdouble, (), )
end

#= --- Elementary Functions --- =#

"""
Argument = theta in radians.

Formula: `z = |z| * e**(i * theta)`

Fortran Name: `CARG(Z)`
"""
function carg(z::ComplexF32)
    ccall((:carg_, libslatec), Cfloat, (Ref{ComplexF32},), z)
end

"""
Cube root.

Fortran Name: `CBRT(X)`, `DCBRT(X)`, `CCBRT(X)`
"""
function cbrt(x::Float32)
    ccall((:cbrt_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Cube root.

Fortran Name: `CBRT(X)`, `DCBRT(X)`, `CCBRT(X)`
"""
function dcbrt(x::Float64)
    ccall((:dcbrt_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Cube root.

Fortran Name: `CBRT(X)`, `DCBRT(X)`, `CCBRT(X)`
"""
function ccbrt(x::ComplexF32)
    ccall((:ccbrt_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Relative error exponential from first order.

Formula: `((e**x) -1) / x`

Fortran Name: `EXPREL(X)`, `DEXPRL(X)`, `CEXPRL(X)`
"""
function exprel(x::Float32)
    ccall((:exprel_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Relative error exponential from first order.

Formula: `((e**x) -1) / x`

Fortran Name: `EXPREL(X)`, `DEXPRL(X)`, `CEXPRL(X)`
"""
function dexprl(x::Float64)
    ccall((:dexprl_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Relative error exponential from first order.

Formula: `((e**x) -1) / x`

Fortran Name: `EXPREL(X)`, `DEXPRL(X)`, `CEXPRL(X)`
"""
function cexprl(x::ComplexF32)
    ccall((:cexprl_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Common logarithm.

Formula: `log to the base 10 of z`

Fortran Name: `CLOG10(Z)`
"""
function clog10(z::ComplexF32)
    ccall((:clog10_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Relative error logarithm.

Formula: `ln(1 + x)`

Fortran Name: `ALNREL(X)`, `DLNREL(X)`, `CLNREL(X)`
"""
function alnrel(x::Float32)
    ccall((:alnrel_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Relative error logarithm.

Formula: `ln(1 + x)`

Fortran Name: `ALNREL(X)`, `DLNREL(X)`, `CLNREL(X)`
"""
function dlnrel(x::Float64)
    ccall((:dlnrel_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Relative error logarithm.

Formula: `ln(1 + x)`

Fortran Name: `ALNREL(X)`, `DLNREL(X)`, `CLNREL(X)`
"""
function clnrel(x::ComplexF32)
    ccall((:clnrel_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Relative error logarithm from second order.

Formula: `(ln(1 + x) - x + x**2/2) / x**3`

Fortran Name: `R9LN2R(X)`, `D9LN2R(X)`, `C9LN2R(X)`
"""
function r9ln2r(x::Float32)
    ccall((:r9ln2r_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Relative error logarithm from second order.

Formula: `(ln(1 + x) - x + x**2/2) / x**3`

Fortran Name: `R9LN2R(X)`, `D9LN2R(X)`, `C9LN2R(X)`
"""
function d9ln2r(x::Float64)
    ccall((:d9ln2r_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Relative error logarithm from second order.

Formula: `(ln(1 + x) - x + x**2/2) / x**3`

Fortran Name: `R9LN2R(X)`, `D9LN2R(X)`, `C9LN2R(X)`
"""
function c9ln2r(x::ComplexF32)
    ccall((:c9ln2r_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

#= --- Trigonometric and Hyperbolic Functions --- =#

"""
Tangent.

Formula: `tan z`

Fortran Name: `CTAN(Z)`
"""
function ctan(z::ComplexF32)
    ccall((:ctan_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Cotangent.

Formula: `cot x`

Fortran Name: `COT(X)`, `DCOT(X)`, `CCOT(X)`
"""
function cot(x::Float32)
    ccall((:cot_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Cotangent.

Formula: `cot x`

Fortran Name: `COT(X)`, `DCOT(X)`, `CCOT(X)`
"""
function dcot(x::Float64)
    ccall((:dcot_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Cotangent.

Formula: `cot x`

Fortran Name: `COT(X)`, `DCOT(X)`, `CCOT(X)`
"""
function ccot(x::ComplexF32)
    ccall((:ccot_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Sine x in degrees.

Formula: `sin((2*pi*x)/360)`

Fortran Name: `SINDG(X)`, `DSINDG(X)`
"""
function sindg(x::Float32)
    ccall((:sindg_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Sine x in degrees.

Formula: `sin((2*pi*x)/360)`

Fortran Name: `SINDG(X)`, `DSINDG(X)`
"""
function dsindg(x::Float64)
    ccall((:dsindg_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Cosine x in degrees.

Formula: `cos((2*pi*x)/360)`

Fortran Name: `COSDG(X)`, `DCOSDG(X)`
"""
function cosdg(x::Float32)
    ccall((:cosdg_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Cosine x in degrees.

Formula: `cos((2*pi*x)/360)`

Fortran Name: `COSDG(X)`, `DCOSDG(X)`
"""
function dcosdg(x::Float64)
    ccall((:dcosdg_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Arc sine.

Formula: `arcsin (z)`

Fortran Name: `CASIN(Z)`
"""
function casin(z::ComplexF32)
    ccall((:casin_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Arc cosine.

Formula: `arccos (z)`

Fortran Name: `CACOS(Z)`
"""
function cacos(z::ComplexF32)
    ccall((:cacos_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Arc tangent.

Formula: `arctan (z)`

Fortran Name: `CATAN(Z)`
"""
function catan(z::ComplexF32)
    ccall((:catan_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Quadrant correct arc tangent.

Formula: `arctan (z1/z2)`

Fortran Name: `CATAN2(Z1`, `Z2)`
"""
function catan2(z1::ComplexF32, z2::ComplexF32)
    ccall((:catan2_, libslatec), ComplexF32, (Ref{ComplexF32}, Ref{ComplexF32}), z1, z2)
end

"""
Hyperbolic sine.

Formula: `sinh z`

Fortran Name: `CSINH(Z)`
"""
function csinh(z::ComplexF32)
    ccall((:csinh_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Hyperbolic cosine.

Formula: `cosh z`

Fortran Name: `CCOSH(Z)`
"""
function ccosh(z::ComplexF32)
    ccall((:ccosh_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Hyperbolic tangent.

Formula: `tanh z`

Fortran Name: `CTANH(Z)`
"""
function ctanh(z::ComplexF32)
    ccall((:ctanh_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Arc hyperbolic sine.

Formula: `arcsinh (x)`

Fortran Name: `ASINH(X)`, `DASINH(X)`, `CASINH(X)`
"""
function asinh(x::Float32)
    ccall((:asinh_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Arc hyperbolic sine.

Formula: `arcsinh (x)`

Fortran Name: `ASINH(X)`, `DASINH(X)`, `CASINH(X)`
"""
function dasinh(x::Float64)
    ccall((:dasinh_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Arc hyperbolic sine.

Formula: `arcsinh (x)`

Fortran Name: `ASINH(X)`, `DASINH(X)`, `CASINH(X)`
"""
function casinh(x::ComplexF32)
    ccall((:casinh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Arc hyperbolic cosine.

Formula: `arccosh (x)`

Fortran Name: `ACOSH(X)`, `DACOSH(X)`, `CACOSH(X)`
"""
function acosh(x::Float32)
    ccall((:acosh_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Arc hyperbolic cosine.

Formula: `arccosh (x)`

Fortran Name: `ACOSH(X)`, `DACOSH(X)`, `CACOSH(X)`
"""
function dacosh(x::Float64)
    ccall((:dacosh_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Arc hyperbolic cosine.

Formula: `arccosh (x)`

Fortran Name: `ACOSH(X)`, `DACOSH(X)`, `CACOSH(X)`
"""
function cacosh(x::ComplexF32)
    ccall((:cacosh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Arc hyperbolic tangent.

Formula: `arctanh (x)`

Fortran Name: `ATANH(X)`, `DATANH(X)`, `CATANH(X)`
"""
function atanh(x::Float32)
    ccall((:atanh_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Arc hyperbolic tangent.

Formula: `arctanh (x)`

Fortran Name: `ATANH(X)`, `DATANH(X)`, `CATANH(X)`
"""
function datanh(x::Float64)
    ccall((:datanh_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Arc hyperbolic tangent.

Formula: `arctanh (x)`

Fortran Name: `ATANH(X)`, `DATANH(X)`, `CATANH(X)`
"""
function catanh(x::ComplexF32)
    ccall((:catanh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Relative error arc tangent from first order.

Formula: `(arctan (x) - x) / x**3`

Fortran Name: `R9ATN1(X)`, `D9ATN1(X)`
"""
function r9atn1(x::Float32)
    ccall((:r9atn1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Relative error arc tangent from first order.

Formula: `(arctan (x) - x) / x**3`

Fortran Name: `R9ATN1(X)`, `D9ATN1(X)`
"""
function d9atn1(x::Float64)
    ccall((:d9atn1_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Exponential Integrals and Related Functions --- =#

"""
Exponential integral Ei(x).

Formula: `(minus) the integral from -x to infinity of (e**-t / t)dt`

Fortran Name: `EI(X)`, `DEI(X)`
"""
function ei(x::Float32)
    ccall((:ei_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Exponential integral Ei(x).

Formula: `(minus) the integral from -x to infinity of (e**-t / t)dt`

Fortran Name: `EI(X)`, `DEI(X)`
"""
function dei(x::Float64)
    ccall((:dei_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Exponential integral E1(x).

Formula: `the integral from x to infinity of (e**-t / t) dt`

Fortran Name: `E1(X)`, `DE1(X)`
"""
function e1(x::Float32)
    ccall((:e1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Exponential integral E1(x).

Formula: `the integral from x to infinity of (e**-t / t) dt`

Fortran Name: `E1(X)`, `DE1(X)`
"""
function de1(x::Float64)
    ccall((:de1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Logarithmic integral li(x).

Formula: `the integral from 0 to x of (1 / ln t) dt`

Fortran Name: `ALI(X)`, `DLI(X)`
"""
function ali(x::Float32)
    ccall((:ali_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Logarithmic integral li(x).

Formula: `the integral from 0 to x of (1 / ln t) dt`

Fortran Name: `ALI(X)`, `DLI(X)`
"""
function dli(x::Float64)
    ccall((:dli_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Gamma Functions and Related Functions --- =#

"""
Factorial.

Formula: `n!`

Fortran Name: `FAC(N)`, `DFAC(N)`
"""
function fac(n::Int32)
    ccall((:fac_, libslatec), Cfloat, (Ref{Int32},), n)
end

"""
Factorial.

Formula: `n!`

Fortran Name: `FAC(N)`, `DFAC(N)`
"""
function dfac(n::Int32)
    ccall((:dfac_, libslatec), Cdouble, (Ref{Int32},), n)
end

"""
Binomial.

Formula: `n!/(m!*(n-m)!)`

Fortran Name: `BINOM(N`, `M)`, `DBINOM(N`, `M)`
"""
function binom(n::Int32, m::Int32)
    ccall((:binom_, libslatec), Cfloat, (Ref{Int32}, Ref{Int32}), n, m)
end

"""
Binomial.

Formula: `n!/(m!*(n-m)!)`

Fortran Name: `BINOM(N`, `M)`, `DBINOM(N`, `M)`
"""
function dbinom(n::Int32, m::Int32)
    ccall((:dbinom_, libslatec), Cdouble, (Ref{Int32}, Ref{Int32}), n, m)
end

"""
Gamma.

Formula: `gamma(x)`

Fortran Name: `GAMMA(X)`, `DGAMMA(X)`, `CGAMMA(X)`
"""
function gamma(x::Float32)
    ccall((:gamma_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Gamma.

Formula: `gamma(x)`

Fortran Name: `GAMMA(X)`, `DGAMMA(X)`, `CGAMMA(X)`
"""
function dgamma(x::Float64)
    ccall((:dgamma_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Gamma.

Formula: `gamma(x)`

Fortran Name: `GAMMA(X)`, `DGAMMA(X)`, `CGAMMA(X)`
"""
function cgamma(x::ComplexF32)
    ccall((:cgamma_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Gamma(x) under and overflow limits.

Fortran Name: `GAMLIM(XMIN`, `XMAX)`, `DGAMLM(XMIN`, `XMAX)`
@param[out] xmin  Minimum legal value of X in gamma(X)
@param[out] xmax  Maximum legal value of X in gamma(X)
"""
function gamlim()
    xmin, xmax = Ref{Float32}(NaN32), Ref{Float32}(NaN32)
    ccall((:gamlim_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}), xmin, xmax)
    xmin[], xmax[]
end

"""
Gamma(x) under and overflow limits.

Fortran Name: `GAMLIM(XMIN`, `XMAX)`, `DGAMLM(XMIN`, `XMAX)`
@param[out] xmin  Minimum legal value of X in gamma(X)
@param[out] xmax  Maximum legal value of X in gamma(X)
"""
function dgamlm()
    xmin, xmax = Ref{Float64}(NaN), Ref{Float64}(NaN)
    ccall((:dgamlm_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}), xmin, xmax)
    xmin[], xmax[]
end

"""
Reciprocal gamma.

Formula: `1 / gamma(x)`

Fortran Name: `GAMR(X)`, `DGAMR(X)`, `CGAMR(X)`
"""
function gamr(x::Float32)
    ccall((:gamr_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Reciprocal gamma.

Formula: `1 / gamma(x)`

Fortran Name: `GAMR(X)`, `DGAMR(X)`, `CGAMR(X)`
"""
function dgamr(x::Float64)
    ccall((:dgamr_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Reciprocal gamma.

Formula: `1 / gamma(x)`

Fortran Name: `GAMR(X)`, `DGAMR(X)`, `CGAMR(X)`
"""
function cgamr(x::ComplexF32)
    ccall((:cgamr_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Log abs gamma.

Formula: `ln |gamma(x)|`

Fortran Name: `ALNGAM(X)`, `DLNGAM(X)`
"""
function alngam(x::Float32)
    ccall((:alngam_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Log abs gamma.

Formula: `ln |gamma(x)|`

Fortran Name: `ALNGAM(X)`, `DLNGAM(X)`
"""
function dlngam(x::Float64)
    ccall((:dlngam_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Log gamma.

Formula: `ln gamma(z)`

Fortran Name: `CLNGAM(Z)`
"""
function clngam(z::ComplexF32)
    ccall((:clngam_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
Log abs gamma with sign.

Formula: `g = ln |gamma(x)|, s = sign gamma(x)`

Fortran Name: `ALGAMS(X`, `G`, `S)`, `DLGAMS(X`, `G`, `S)`
@param[in]  x  Argument
@param[out] g  Log absolute gamma
@param[out] s  Sign of gamma, `+1.0` or `-1.0`
"""
function algams(x::Float32)
    loggam, sgn = Ref{Float32}(NaN32), Ref{Float32}(NaN32)
    ccall((:algams_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Float32}),
        x, loggam, sgn)
    loggam[], sgn[]
end

"""
Log abs gamma with sign.

Formula: `g = ln |gamma(x)|, s = sign gamma(x)`

Fortran Name: `ALGAMS(X`, `G`, `S)`, `DLGAMS(X`, `G`, `S)`
@param[in]  x  Argument
@param[out] g  Log absolute gamma
@param[out] s  Sign of gamma, `+1.0` or `-1.0`
"""
function dlgams(x::Float64)
    loggam, sgn = Ref{Float64}(NaN), Ref{Float64}(NaN)
    ccall((:dlgams_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Float64}),
        x, loggam, sgn)
    loggam[], sgn[]
end

"""
Incomplete gamma.

Formula: `gamma(a,x) = integral from 0 to x of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMI(A`, `X)`, `DGAMI(A`, `X)`
"""
function gami(a::Float32, x::Float32)
    ccall((:gami_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

"""
Incomplete gamma.

Formula: `gamma(a,x) = integral from 0 to x of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMI(A`, `X)`, `DGAMI(A`, `X)`
"""
function dgami(a::Float64, x::Float64)
    ccall((:dgami_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
Complementary incomplete gamma.

Formula: `gamma(a,x) = integral from x to infinity of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMIC(A`, `X)`, `DGAMIC(A`, `X)`
"""
function gamic(a::Float32, x::Float32)
    ccall((:gamic_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

"""
Complementary incomplete gamma.

Formula: `gamma(a,x) = integral from x to infinity of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMIC(A`, `X)`, `DGAMIC(A`, `X)`
"""
function dgamic(a::Float64, x::Float64)
    ccall((:dgamic_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
Tricomi's incomplete gamma.

Formula: `gamma*(a,x) = x**-a * incomplete gamma(a,x) / gamma(a)`

Fortran Name: `GAMIT(A`, `X)`, `DGAMIT(A`, `X)`
"""
function gamit(a::Float32, x::Float32)
    ccall((:gamit_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

"""
Tricomi's incomplete gamma.

Formula: `gamma*(a,x) = x**-a * incomplete gamma(a,x) / gamma(a)`

Fortran Name: `GAMIT(A`, `X)`, `DGAMIT(A`, `X)`
"""
function dgamit(a::Float64, x::Float64)
    ccall((:dgamit_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
Psi (Digamma).

Formula: `psi(x) = gamma'(x) / gamma(x)`

Fortran Name: `PSI(X)`, `DPSI(X)`, `CPSI(X)`
"""
function psi(x::Float32)
    ccall((:psi_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Psi (Digamma).

Formula: `psi(x) = gamma'(x) / gamma(x)`

Fortran Name: `PSI(X)`, `DPSI(X)`, `CPSI(X)`
"""
function dpsi(x::Float64)
    ccall((:dpsi_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Psi (Digamma).

Formula: `psi(x) = gamma'(x) / gamma(x)`

Fortran Name: `PSI(X)`, `DPSI(X)`, `CPSI(X)`
"""
function cpsi(x::ComplexF32)
    ccall((:cpsi_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
Pochhammer's generalized symbol.

Formula: `(a) sub x = gamma(a+x) / gamma(a)`

Fortran Name: `POCH(A`, `X)`, `DPOCH(A`, `X)`
"""
function poch(a::Float32, x::Float32)
    ccall((:poch_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

"""
Pochhammer's generalized symbol.

Formula: `(a) sub x = gamma(a+x) / gamma(a)`

Fortran Name: `POCH(A`, `X)`, `DPOCH(A`, `X)`
"""
function dpoch(a::Float64, x::Float64)
    ccall((:dpoch_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
Pochhammer's symbol from first order.

Formula: `((a) sub x -1) / x`

Fortran Name: `POCH1(A`, `X)`, `DPOCH1(A`, `X)`
"""
function poch1(a::Float32, x::Float32)
    ccall((:poch1_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

"""
Pochhammer's symbol from first order.

Formula: `((a) sub x -1) / x`

Fortran Name: `POCH1(A`, `X)`, `DPOCH1(A`, `X)`
"""
function dpoch1(a::Float64, x::Float64)
    ccall((:dpoch1_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
Beta.

Formula: `b(a,b) = (gamma(a) * gamma(b)) / gamma(a+b)`
= integral from 0 to 1 of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETA(A`, `B)`, `DBETA(A`, `B)`, `CBETA(A`, `B)`
"""
function beta(a::Float32, b::Float32)
    ccall((:beta_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, b)
end

"""
Beta.

Formula: `b(a,b) = (gamma(a) * gamma(b)) / gamma(a+b)`
= integral from 0 to 1 of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETA(A`, `B)`, `DBETA(A`, `B)`, `CBETA(A`, `B)`
"""
function dbeta(a::Float64, b::Float64)
    ccall((:dbeta_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, b)
end

"""
Beta.

Formula: `b(a,b) = (gamma(a) * gamma(b)) / gamma(a+b)`
= integral from 0 to 1 of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETA(A`, `B)`, `DBETA(A`, `B)`, `CBETA(A`, `B)`
"""
function cbeta(a::ComplexF32, b::ComplexF32)
    ccall((:cbeta_, libslatec), ComplexF32, (Ref{ComplexF32}, Ref{ComplexF32}), a, b)
end

"""
Log beta.

Formula: `ln b(a,b)`

Fortran Name: `ALBETA(A`, `B)`, `DLBETA(A`, `B)`, `CLBETA(A`, `B)`
"""
function albeta(a::Float32, b::Float32)
    ccall((:albeta_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, b)
end

"""
Log beta.

Formula: `ln b(a,b)`

Fortran Name: `ALBETA(A`, `B)`, `DLBETA(A`, `B)`, `CLBETA(A`, `B)`
"""
function dlbeta(a::Float64, b::Float64)
    ccall((:dlbeta_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, b)
end

"""
Log beta.

Formula: `ln b(a,b)`

Fortran Name: `ALBETA(A`, `B)`, `DLBETA(A`, `B)`, `CLBETA(A`, `B)`
"""
function clbeta(a::ComplexF32, b::ComplexF32)
    ccall((:clbeta_, libslatec), ComplexF32, (Ref{ComplexF32}, Ref{ComplexF32}), a, b)
end

"""
Incomplete beta.

Formula: `i sub x (a,b) = b sub x (a,b) / b(a,b)`
= 1 / b(a,b) * integral from 0 to x of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETAI(X`, `A`, `B)`, `DBETAI(X`, `A`, `B)`
"""
function betai(x::Float32, a::Float32, b::Float32)
    ccall((:betai_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}, Ref{Float32}), x, a, b)
end

"""
Incomplete beta.

Formula: `i sub x (a,b) = b sub x (a,b) / b(a,b)`
= 1 / b(a,b) * integral from 0 to x of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETAI(X`, `A`, `B)`, `DBETAI(X`, `A`, `B)`
"""
function dbetai(x::Float64, a::Float64, b::Float64)
    ccall((:dbetai_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}, Ref{Float64}), x, a, b)
end

"""
Log gamma correction term.

Formula: `ln gamma(x) - (ln(2 * pi))/2 - (x - 1/2) * ln(x) + x`

Fortran Name: `R9LGMC(X)`, `D9LGMC(X)`, `C9LGMC(X)`
"""
function r9lgmc(x::Float32)
    ccall((:r9lgmc_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Log gamma correction term.

Formula: `ln gamma(x) - (ln(2 * pi))/2 - (x - 1/2) * ln(x) + x`

Fortran Name: `R9LGMC(X)`, `D9LGMC(X)`, `C9LGMC(X)`
"""
function d9lgmc(x::Float64)
    ccall((:d9lgmc_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Log gamma correction term.

Formula: `ln gamma(x) - (ln(2 * pi))/2 - (x - 1/2) * ln(x) + x`

Fortran Name: `R9LGMC(X)`, `D9LGMC(X)`, `C9LGMC(X)`
"""
function c9lgmc(x::ComplexF32)
    ccall((:c9lgmc_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

#= --- Error Functions and Fresnel Integrals --- =#

"""
Error function.

Formula: `erf x = (2 / square root of pi) * the integral from 0 to x of e**(-t**2)dt`

Fortran Name: `ERF(X)`, `DERF(X)`
"""
function erf(x::Float32)
    ccall((:erf_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Error function.

Formula: `erf x = (2 / square root of pi) * the integral from 0 to x of e**(-t**2)dt`

Fortran Name: `ERF(X)`, `DERF(X)`
"""
function derf(x::Float64)
    ccall((:derf_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Complementary error function.

Formula: `erfc x = (2 / square root of pi) * the integral from x to infinity of e**(-t**2)dt`

Fortran Name: `ERFC(X)`, `DERFC(X)`
"""
function erfc(x::Float32)
    ccall((:erfc_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Complementary error function.

Formula: `erfc x = (2 / square root of pi) * the integral from x to infinity of e**(-t**2)dt`

Fortran Name: `ERFC(X)`, `DERFC(X)`
"""
function derfc(x::Float64)
    ccall((:derfc_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Dawson's function.

Formula: `F(x) = e**(-x**2) * the integral from 0 to x of e**(t**2)dt`

Fortran Name: `DAWS(X)`, `DDAWS(X)`
"""
function daws(x::Float32)
    ccall((:daws_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Dawson's function.

Formula: `F(x) = e**(-x**2) * the integral from 0 to x of e**(t**2)dt`

Fortran Name: `DAWS(X)`, `DDAWS(X)`
"""
function ddaws(x::Float64)
    ccall((:ddaws_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Bessel Functions --- =#

"""
Bessel function of the first kind, order zero.

Formula: `J sub 0 (x)`

Fortran Name: `BESJ0(X)`, `DBESJ0(X)`
"""
function besj0(x::Float32)
    ccall((:besj0_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Bessel function of the first kind, order zero.

Formula: `J sub 0 (x)`

Fortran Name: `BESJ0(X)`, `DBESJ0(X)`
"""
function dbesj0(x::Float64)
    ccall((:dbesj0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Bessel function of the first kind, order one.

Formula: `J sub 1 (x)`

Fortran Name: `BESJ1(X)`, `DBESJ1(X)`
"""
function besj1(x::Float32)
    ccall((:besj1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Bessel function of the first kind, order one.

Formula: `J sub 1 (x)`

Fortran Name: `BESJ1(X)`, `DBESJ1(X)`
"""
function dbesj1(x::Float64)
    ccall((:dbesj1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Bessel function of the second kind, order zero.

Formula: `Y sub 0 (x)`

Fortran Name: `BESY0(X)`, `DBESY0(X)`
"""
function besy0(x::Float32)
    ccall((:besy0_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Bessel function of the second kind, order zero.

Formula: `Y sub 0 (x)`

Fortran Name: `BESY0(X)`, `DBESY0(X)`
"""
function dbesy0(x::Float64)
    ccall((:dbesy0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Bessel function of the second kind, order one.

Formula: `Y sub 1 (x)`

Fortran Name: `BESY1(X)`, `DBESY1(X)`
"""
function besy1(x::Float32)
    ccall((:besy1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Bessel function of the second kind, order one.

Formula: `Y sub 1 (x)`

Fortran Name: `BESY1(X)`, `DBESY1(X)`
"""
function dbesy1(x::Float64)
    ccall((:dbesy1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the first kind, order zero.

Formula: `I sub 0 (x)`

Fortran Name: `BESI0(X)`, `DBESI0(X)`
"""
function besi0(x::Float32)
    ccall((:besi0_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the first kind, order zero.

Formula: `I sub 0 (x)`

Fortran Name: `BESI0(X)`, `DBESI0(X)`
"""
function dbesi0(x::Float64)
    ccall((:dbesi0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the first kind, order one.

Formula: `I sub 1 (x)`

Fortran Name: `BESI1(X)`, `DBESI1(X)`
"""
function besi1(x::Float32)
    ccall((:besi1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the first kind, order one.

Formula: `I sub 1 (x)`

Fortran Name: `BESI1(X)`, `DBESI1(X)`
"""
function dbesi1(x::Float64)
    ccall((:dbesi1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the third kind, order zero.

Formula: `K sub 0 (x)`

Fortran Name: `BESK0(X)`, `DBESK0(X)`
"""
function besk0(x::Float32)
    ccall((:besk0_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the third kind, order zero.

Formula: `K sub 0 (x)`

Fortran Name: `BESK0(X)`, `DBESK0(X)`
"""
function dbesk0(x::Float64)
    ccall((:dbesk0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the third kind, order one.

Formula: `K sub 1 (x)`

Fortran Name: `BESK1(X)`, `DBESK1(X)`
"""
function besk1(x::Float32)
    ccall((:besk1_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the third kind, order one.

Formula: `K sub 1 (x)`

Fortran Name: `BESK1(X)`, `DBESK1(X)`
"""
function dbesk1(x::Float64)
    ccall((:dbesk1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the first kind, order zero, scaled.

Formula: `e**-|x| * I sub 0(x)`

Fortran Name: `BESI0E(X)`, `DBSI0E(X)`
"""
function besi0e(x::Float32)
    ccall((:besi0e_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the first kind, order zero, scaled.

Formula: `e**-|x| * I sub 0(x)`

Fortran Name: `BESI0E(X)`, `DBSI0E(X)`
"""
function dbsi0e(x::Float64)
    ccall((:dbsi0e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the first kind, order one, scaled.

Formula: `e**-|x| * I sub 1(x)`

Fortran Name: `BESI1E(X)`, `DBSI1E(X)`
"""
function besi1e(x::Float32)
    ccall((:besi1e_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the first kind, order one, scaled.

Formula: `e**-|x| * I sub 1(x)`

Fortran Name: `BESI1E(X)`, `DBSI1E(X)`
"""
function dbsi1e(x::Float64)
    ccall((:dbsi1e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the third kind, order zero, scaled.

Formula: `e**x * K sub 0 (x)`

Fortran Name: `BESK0E(X)`, `DBSK0E(X)`
"""
function besk0e(x::Float32)
    ccall((:besk0e_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the third kind, order zero, scaled.

Formula: `e**x * K sub 0 (x)`

Fortran Name: `BESK0E(X)`, `DBSK0E(X)`
"""
function dbsk0e(x::Float64)
    ccall((:dbsk0e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Modified Bessel function of the third kind, order one, scaled.

Formula: `e**x * K sub 1 (x)`

Fortran Name: `BESK1E(X)`, `DBSK1E(X)`
"""
function besk1e(x::Float32)
    ccall((:besk1e_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Modified Bessel function of the third kind, order one, scaled.

Formula: `e**x * K sub 1 (x)`

Fortran Name: `BESK1E(X)`, `DBSK1E(X)`
"""
function dbsk1e(x::Float64)
    ccall((:dbsk1e_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Bessel Functions of Fractional Order --- =#

"""
Airy function Ai.

Formula: `Ai(x)`

Fortran Name: `AI(X)`, `DAI(X)`
"""
function ai(x::Float32)
    ccall((:ai_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Airy function Ai.

Formula: `Ai(x)`

Fortran Name: `AI(X)`, `DAI(X)`
"""
function dai(x::Float64)
    ccall((:dai_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Airy function Bi.

Formula: `Bi(x)`

Fortran Name: `BI(X)`, `DBI(X)`
"""
function bi(x::Float32)
    ccall((:bi_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Airy function Bi.

Formula: `Bi(x)`

Fortran Name: `BI(X)`, `DBI(X)`
"""
function dbi(x::Float64)
    ccall((:dbi_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Exponentially scaled Airy function Ai.

Formula: `Ai(x), x <= 0; exp(2/3 * x**(3/2)) * Ai(x), x >= 0`

Fortran Name: `AIE(X)`, `DAIE(X)`
"""
function aie(x::Float32)
    ccall((:aie_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Exponentially scaled Airy function Ai.

Formula: `Ai(x), x <= 0; exp(2/3 * x**(3/2)) * Ai(x), x >= 0`

Fortran Name: `AIE(X)`, `DAIE(X)`
"""
function daie(x::Float64)
    ccall((:daie_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
Exponentially scaled Airy function Bi.

Formula: `Bi(x), x <= 0; exp(-2/3 * x**(3/2)) * Bi(x), x >= 0`

Fortran Name: `BIE(X)`, `DBIE(X)`
"""
function bie(x::Float32)
    ccall((:bie_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Exponentially scaled Airy function Bi.

Formula: `Bi(x), x <= 0; exp(-2/3 * x**(3/2)) * Bi(x), x >= 0`

Fortran Name: `BIE(X)`, `DBIE(X)`
"""
function dbie(x::Float64)
    ccall((:dbie_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Confluent Hypergeometric Functions --- =#

"""
Confluent hypergeometric function.

Formula: `U(a,b,x)`

This routine is not valid when `1+A-B` is close to zero if X is small.

Fortran Name: `CHU(A`, `B`, `X)`, `DCHU(A`, `B`, `X)`
"""
function chu(a::Float32, b::Float32, x::Float32)
    ccall((:chu_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}, Ref{Float32}), a, b, x)
end

"""
Confluent hypergeometric function.

This routine is not valid when `1+A-B` is close to zero if X is small.

Formula: `U(a,b,x)`

Fortran Name: `CHU(A`, `B`, `X)`, `DCHU(A`, `B`, `X)`
"""
function dchu(a::Float64, b::Float64, x::Float64)
    ccall((:dchu_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}, Ref{Float64}), a, b, x)
end

#= --- Miscellaneous Functions --- =#

"""
Spence dilogarithm.

Formula: `s(x) = - the integral from 0 to x of ((ln |1-y|) / y)dy`

Fortran Name: `SPENC(X)`, `DSPENC(X)`
"""
function spenc(x::Float32)
    ccall((:spenc_, libslatec), Cfloat, (Ref{Float32},), x)
end

"""
Spence dilogarithm.

Formula: `s(x) = - the integral from 0 to x of ((ln |1-y|) / y)dy`

Fortran Name: `SPENC(X)`, `DSPENC(X)`
"""
function dspenc(x::Float64)
    ccall((:dspenc_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Forwarding functions for Float64 --- =#

# Intrinsic Functions and Fundamental Functions
r9upak(x::Float64) = d9upak(x)
r9pak(y::Float64, n::Int32) = d9pak(y, n)
inits(os::Vector{Float64}, eta::Float64) = initds(os, eta)
csevl(::Type{Float64}) = dcsevl()
csevl(::Type{Float32}) = csevl()
# Elementary Functions
cbrt(x::Float64) = dcbrt(x)
exprel(x::Float64) = dexprl(x)
alnrel(x::Float64) = dlnrel(x)
r9ln2r(x::Float64) = d9ln2r(x)
# Trigonometric and Hyperbolic Functions
cot(x::Float64) = dcot(x)
sindg(x::Float64) = dsindg(x)
cosdg(x::Float64) = dcosdg(x)
asinh(x::Float64) = dasinh(x)
acosh(x::Float64) = dacosh(x)
atanh(x::Float64) = datanh(x)
r9atn1(x::Float64) = d9atn1(x)
# Exponential Integrals and Related Functions
ei(x::Float64) = dei(x)
e1(x::Float64) = de1(x)
ali(x::Float64) = dli(x)
# Gamma Functions and Related Functions
fac(n::Int32, ::Type{Float64}) = dfac(n)
fac(n::Int32, ::Type{Float32}) = fac(n)
binom(n::Int32, m::Int32, ::Type{Float64}) = dbinom(n, m)
binom(n::Int32, m::Int32, ::Type{Float32}) = binom(n, m)
gamma(x::Float64) = dgamma(x)
gamlim(::Type{Float32}) = gamlim()
gamlim(::Type{Float64}) = dgamlm()
gamr(x::Float64) = dgamr(x)
alngam(x::Float64) = dlngam(x)
algams(x::Float64) = dlgams(x)
gami(a::Float64, x::Float64) = dgami(a, x)
gamic(a::Float64, x::Float64) = dgamic(a, x)
gamit(a::Float64, x::Float64) = dgamit(a, x)
psi(x::Float64) = dpsi(x)
poch(a::Float64, x::Float64) = dpoch(a, x)
poch1(a::Float64, x::Float64) = dpoch1(a, x)
beta(a::Float64, b::Float64) = dbeta(a, b)
albeta(a::Float64, b::Float64) = dlbeta(a, b)
betai(x::Float64, a::Float64, b::Float64) = dbetai(x, a, b)
r9lgmc(x::Float64) = d9lgmc(x)
# Error Functions and Fresnel Integrals
erf(x::Float64) = derf(x)
erfc(x::Float64) = derfc(x)
daws(x::Float64) = ddaws(x)
# Bessel Functions
#   Bessel functions of special integer order
besj0(x::Float64) = dbesj0(x)
besj1(x::Float64) = dbesj1(x)
besy0(x::Float64) = dbesy0(x)
besy1(x::Float64) = dbesy1(x)
#   Modified (hyperbolic) Bessel functions of special integer order
#   scaled by an exponential
besi0(x::Float64) = dbesi0(x)
besi1(x::Float64) = dbesi1(x)
besk0(x::Float64) = dbesk0(x)
besk1(x::Float64) = dbesk1(x)
besi0e(x::Float64) = dbsi0e(x)
besi1e(x::Float64) = dbsi1e(x)
besk0e(x::Float64) = dbsk0e(x)
besk1e(x::Float64) = dbsk1e(x)
#   Sequences of Bessel functions.

# Bessel Functions of Fractional Order
ai(x::Float64) = dai(x)
bi(x::Float64) = dbi(x)
aie(x::Float64) = daie(x)
bie(x::Float64) = dbie(x)
# Confluent Hypergeometric Functions
chu(a::Float64, b::Float64, x::Float64) = dchu(a, b, x)
# Miscellaneous Functions
spenc(x::Float64) = dspenc(x)

# Complex Functions forwarding
cbrt(x::ComplexF32) = ccbrt(x)
exprel(x::ComplexF32) = cexprl(x)
alnrel(x::ComplexF32) = clnrel(x)
r9ln2r(x::ComplexF32) = c9ln2r(x)
cot(x::ComplexF32) = ccot(x)
asinh(x::ComplexF32) = casinh(x)
acosh(x::ComplexF32) = cacosh(x)
atanh(x::ComplexF32) = catanh(x)
gamma(x::ComplexF32) = cgamma(x)
gamr(x::ComplexF32) = cgamr(x)
alngam(x::ComplexF32) = clngam(x)
psi(x::ComplexF32) = cpsi(x)
beta(a::ComplexF32, b::ComplexF32) = cbeta(a, b)
albeta(a::ComplexF32, b::ComplexF32) = clbeta(a, b)
r9lgmc(x::ComplexF32) = c9lgmc(x)

end # module FNLIB
