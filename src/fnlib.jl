# SPDX-License-Identifier: MIT
# Reading from: docs/capi/fnlib.h
"""
    SLATEC.FNLIB

A collection of routines for
evaluating elementary and special functions.

Most of the these routines were written by Wayne Fullerton while at LANL.
Some were written by Don Amos of SNLA.
There are approximately 63 single precision, 63 double precision and
25 complex user callable elementary and special function routines.

Function categories:

- Intrinsic Functions and Fundamental Functions
- Elementary Functions
- Trigonometric and Hyperbolic Functions
- Exponential Integrals and Related Functions
- Gamma Functions and Related Functions
- Error Functions and Fresnel Integrals
- Bessel Functions
- Bessel Functions of Fractional Order
- Confluent Hypergeometric Functions
- Miscellaneous Functions

# References

- [netlib/fn](https://www.netlib.org/fn/)
- [netlib/vfnlib](https://www.netlib.org/vfnlib/index.html)
- [netlib/slatec/fundoc.f](https://www.netlib.org/slatec/src/fundoc.f)
"""
module FNLIB

using SLATEC_jll
const libslatec = SLATEC_jll.libslatec


#= --- Intrinsic Functions and Fundamental Functions --- =#

"""
    r9upak(x::Float32)
    r9upak(x::Float64)

Unpack a floating point number X so that `X = Y * 2^N`,
where `Y` is between 0.5 and 1.0.

- `x`:   Input floating point number

Return:
- `y`:   Mantissa
- `n`:   Exponent

Fortran Name: `R9UPAK(X`, `Y`, `N)`, `D9UPAK(X`, `Y`, `N)`
"""
function r9upak(x::Float32)
    y, n = Ref{Float32}(NaN32), Ref{Int32}(0)
    ccall((:r9upak_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}),
        x, y, n)
    y[], n[]
end

function d9upak(x::Float64)
    y, n = Ref{Float64}(NaN), Ref{Int32}(0)
    ccall((:d9upak_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}),
        x, y, n)
    y[], n[]
end

"""
    r9pak(y::Float32, n::Int32)
    r9pak(y::Float64, n::Int32)

Pack a base 2 exponent into a floating point number.

- `y`:   Mantissa
- `n`:   Exponent

Reutrn
- Packed floating point number

Fortran Name: `R9PAK(Y`, `N)`, `D9PAK(Y`, `N)`
"""
function r9pak(y::Float32, n::Int32)
    ccall((:r9pak_, libslatec), Cfloat, (Ref{Float32}, Ref{Int32}), y, n)
end

function d9pak(y::Float64, n::Int32)
    ccall((:d9pak_, libslatec), Cdouble, (Ref{Float64}, Ref{Int32}), y, n)
end

"""
    inits(os::Vector{Float32}, eta::Float32)
    inits(os::Vector{Float64}, eta::Float64)

Determine the number of terms needed in an orthogonal
polynomial series so that it meets a specified accuracy.

- `os`:    Coefficients in an orthogonal series.
- `eta`:   Requested accuracy of the series.

Reutrn
- Number of terms needed to meet the accuracy.

Fortran Name: `INITS(OS`, `NOS`, `ETA)`, `INITDS(OS`, `NOS`, `ETA)`
"""
function inits(os::Vector{Float32}, eta::Float32)
    ccall((:inits_, libslatec), Cint, (Ptr{Cfloat}, Ref{Cint}, Ref{Cfloat}),
        os, Ref(Cint(length(os))), Ref(eta))
end

function initds(os::Vector{Float64}, eta::Float64)
    ccall((:initds_, libslatec), Cint, (Ptr{Cdouble}, Ref{Cint}, Ref{Cdouble}),
        os, Ref(Cint(length(os))), Ref(eta))
end

"""
    csevl(x::Float32, cs::Vector{Float32})
    csevl(x::Float64, cs::Vector{Float64})

Evaluate Chebyshev series.

Formula: `summation for i = 1 to n of cs(i)*(2*x)**(i-1)`

- `x`:   Input value
- `cs`:  Coefficients in the Chebyshev series.
- `n`:   Number of coefficients in `cs`.

Reutrn
- Value of the Chebyshev series at `x`.

Fortran Name: `CSEVL(X`, `CS`, `N)`, `DCSEVL(X`, `CS`, `N)`
"""
function csevl(x::Float32, cs::Vector{Float32})
    ccall((:csevl_, libslatec), Cfloat, (Ref{Float32}, Ptr{Cfloat}, Ref{Cint}),
        x, cs, Ref(Cint(length(cs))))
end

function dcsevl(x::Float64, cs::Vector{Float64})
    ccall((:dcsevl_, libslatec), Cdouble, (Ref{Float64}, Ptr{Cdouble}, Ref{Cint}),
        x, cs, Ref(Cint(length(cs))))
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
    cbrt(x::Float32)
    cbrt(x::Float64)
    cbrt(x::ComplexF32)

Cube root.

Fortran Name: `CBRT(X)`, `DCBRT(X)`, `CCBRT(X)`
"""
function cbrt(x::Float32)
    ccall((:cbrt_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dcbrt(x::Float64)
    ccall((:dcbrt_, libslatec), Cdouble, (Ref{Float64},), x)
end

function ccbrt(x::ComplexF32)
    ccall((:ccbrt_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    exprel(x::Float32)
    exprel(x::Float64)
    exprel(x::ComplexF32)

Relative error exponential from first order.

Formula: `((e**x) -1) / x`

Fortran Name: `EXPREL(X)`, `DEXPRL(X)`, `CEXPRL(X)`
"""
function exprel(x::Float32)
    ccall((:exprel_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dexprl(x::Float64)
    ccall((:dexprl_, libslatec), Cdouble, (Ref{Float64},), x)
end

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
    alnrel(x::Float32)
    alnrel(x::Float64)
    alnrel(x::ComplexF32)

Relative error logarithm.

Formula: `ln(1 + x)`

Fortran Name: `ALNREL(X)`, `DLNREL(X)`, `CLNREL(X)`
"""
function alnrel(x::Float32)
    ccall((:alnrel_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dlnrel(x::Float64)
    ccall((:dlnrel_, libslatec), Cdouble, (Ref{Float64},), x)
end

function clnrel(x::ComplexF32)
    ccall((:clnrel_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    r9ln2r(x::Float32)
    r9ln2r(x::Float64)
    r9ln2r(x::ComplexF32)

Relative error logarithm from second order.

Formula: `(ln(1 + x) - x + x**2/2) / x**3`

Fortran Name: `R9LN2R(X)`, `D9LN2R(X)`, `C9LN2R(X)`
"""
function r9ln2r(x::Float32)
    ccall((:r9ln2r_, libslatec), Cfloat, (Ref{Float32},), x)
end

function d9ln2r(x::Float64)
    ccall((:d9ln2r_, libslatec), Cdouble, (Ref{Float64},), x)
end

function c9ln2r(x::ComplexF32)
    ccall((:c9ln2r_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

#= --- Trigonometric and Hyperbolic Functions --- =#

"""
    ctan(z::ComplexF32)

Tangent.

Formula: `tan z`

Fortran Name: `CTAN(Z)`
"""
function ctan(z::ComplexF32)
    ccall((:ctan_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
    cot(x::Float32)
    cot(x::Float64)
    cot(x::ComplexF32)

Cotangent.

Formula: `cot x`

Fortran Name: `COT(X)`, `DCOT(X)`, `CCOT(X)`
"""
function cot(x::Float32)
    ccall((:cot_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dcot(x::Float64)
    ccall((:dcot_, libslatec), Cdouble, (Ref{Float64},), x)
end

function ccot(x::ComplexF32)
    ccall((:ccot_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    sindg(x::Float32)
    sindg(x::Float64)

Sine x in degrees.

Formula: `sin((2*pi*x)/360)`

Fortran Name: `SINDG(X)`, `DSINDG(X)`
"""
function sindg(x::Float32)
    ccall((:sindg_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dsindg(x::Float64)
    ccall((:dsindg_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    cosdg(x::Float32)
    cosdg(x::Float64)

Cosine x in degrees.

Formula: `cos((2*pi*x)/360)`

Fortran Name: `COSDG(X)`, `DCOSDG(X)`
"""
function cosdg(x::Float32)
    ccall((:cosdg_, libslatec), Cfloat, (Ref{Float32},), x)
end

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
    asinh(x::Float32)
    asinh(x::Float64)
    asinh(x::ComplexF32)

Arc hyperbolic sine.

Formula: `arcsinh (x)`

Fortran Name: `ASINH(X)`, `DASINH(X)`, `CASINH(X)`
"""
function asinh(x::Float32)
    ccall((:asinh_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dasinh(x::Float64)
    ccall((:dasinh_, libslatec), Cdouble, (Ref{Float64},), x)
end

function casinh(x::ComplexF32)
    ccall((:casinh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    acosh(x::Float32)
    acosh(x::Float64)
    acosh(x::ComplexF32)

Arc hyperbolic cosine.

Formula: `arccosh (x)`

Fortran Name: `ACOSH(X)`, `DACOSH(X)`, `CACOSH(X)`
"""
function acosh(x::Float32)
    ccall((:acosh_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dacosh(x::Float64)
    ccall((:dacosh_, libslatec), Cdouble, (Ref{Float64},), x)
end

function cacosh(x::ComplexF32)
    ccall((:cacosh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    atanh(x::Float32)
    atanh(x::Float64)
    atanh(x::ComplexF32)

Arc hyperbolic tangent.

Formula: `arctanh (x)`

Fortran Name: `ATANH(X)`, `DATANH(X)`, `CATANH(X)`
"""
function atanh(x::Float32)
    ccall((:atanh_, libslatec), Cfloat, (Ref{Float32},), x)
end

function datanh(x::Float64)
    ccall((:datanh_, libslatec), Cdouble, (Ref{Float64},), x)
end

function catanh(x::ComplexF32)
    ccall((:catanh_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    r9atn1(x::Float32)
    r9atn1(x::Float64)

Relative error arc tangent from first order.

Formula: `(arctan (x) - x) / x**3`

Fortran Name: `R9ATN1(X)`, `D9ATN1(X)`
"""
function r9atn1(x::Float32)
    ccall((:r9atn1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function d9atn1(x::Float64)
    ccall((:d9atn1_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Exponential Integrals and Related Functions --- =#

"""
    ei(x::Float32)
    ei(x::Float64)

Exponential integral Ei(x).

Formula: `(minus) the integral from -x to infinity of (e**-t / t)dt`

Fortran Name: `EI(X)`, `DEI(X)`
"""
function ei(x::Float32)
    ccall((:ei_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dei(x::Float64)
    ccall((:dei_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    e1(x::Float32)
    e1(x::Float64)

Exponential integral E1(x).

Formula: `the integral from x to infinity of (e**-t / t) dt`

Fortran Name: `E1(X)`, `DE1(X)`
"""
function e1(x::Float32)
    ccall((:e1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function de1(x::Float64)
    ccall((:de1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    ali(x::Float32)
    ali(x::Float64)

Logarithmic integral li(x).

Formula: `the integral from 0 to x of (1 / ln t) dt`

Fortran Name: `ALI(X)`, `DLI(X)`
"""
function ali(x::Float32)
    ccall((:ali_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dli(x::Float64)
    ccall((:dli_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Gamma Functions and Related Functions --- =#

"""
    fac(n::Int32) :: Float32
    fac(n::Int32, ::Type{Float32}) :: Float32
    fac(n::Int32, ::Type{Float64}) :: Float64

Factorial.

Formula: `n!`

Fortran Name: `FAC(N)`, `DFAC(N)`
"""
function fac(n::Int32)
    ccall((:fac_, libslatec), Cfloat, (Ref{Int32},), n)
end

"""
    dfac(n::Int32):: Float64
    fac(n::Int32, ::Type{Float64})

Factorial.

Formula: `n!`

Fortran Name: `DFAC(N)`
"""
function dfac(n::Int32)
    ccall((:dfac_, libslatec), Cdouble, (Ref{Int32},), n)
end

"""
    binom(n::Int32, m::Int32) :: Float32
    binom(n::Int32, m::Int32, ::Type{Float32}) :: Float32
    binom(n::Int32, m::Int32, ::Type{Float64}) :: Float64

Binomial.

Formula: `n!/(m!*(n-m)!)`

Fortran Name: `BINOM(N`, `M)`, `DBINOM(N`, `M)`
"""
function binom(n::Int32, m::Int32)
    ccall((:binom_, libslatec), Cfloat, (Ref{Int32}, Ref{Int32}), n, m)
end

"""
    dbinom(n::Int32, m::Int32) :: Float64
    binom(n::Int32, m::Int32, ::Type{Float64}) :: Float64

Binomial.

Formula: `n!/(m!*(n-m)!)`

Fortran Name: `DBINOM(N`, `M)`
"""
function dbinom(n::Int32, m::Int32)
    ccall((:dbinom_, libslatec), Cdouble, (Ref{Int32}, Ref{Int32}), n, m)
end

"""
    gamma(x::Float32)
    gamma(x::Float64)
    gamma(x::ComplexF32)

Gamma.

Formula: `gamma(x)`

Fortran Name: `GAMMA(X)`, `DGAMMA(X)`, `CGAMMA(X)`
"""
function gamma(x::Float32)
    ccall((:gamma_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dgamma(x::Float64)
    ccall((:dgamma_, libslatec), Cdouble, (Ref{Float64},), x)
end

function cgamma(x::ComplexF32)
    ccall((:cgamma_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    gamlim(::Type{Float32}) :: Tuple{Float32, Float32}
    gamlim(::Type{Float64}) :: Tuple{Float64, Float64}

Gamma(x) under and overflow limits.

Return:
- `xmin`:   Minimum legal value of X in gamma(X)
- `xmax`:   Maximum legal value of X in gamma(X)

Fortran Name: `GAMLIM(XMIN`, `XMAX)`, `DGAMLM(XMIN`, `XMAX)`
"""
function gamlim()
    xmin, xmax = Ref{Float32}(NaN32), Ref{Float32}(NaN32)
    ccall((:gamlim_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}), xmin, xmax)
    xmin[], xmax[]
end

function dgamlm()
    xmin, xmax = Ref{Float64}(NaN), Ref{Float64}(NaN)
    ccall((:dgamlm_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}), xmin, xmax)
    xmin[], xmax[]
end

"""
    gamr(x::Float32)
    gamr(x::Float64)
    gamr(x::ComplexF32)

Reciprocal gamma.

Formula: `1 / gamma(x)`

Fortran Name: `GAMR(X)`, `DGAMR(X)`, `CGAMR(X)`
"""
function gamr(x::Float32)
    ccall((:gamr_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dgamr(x::Float64)
    ccall((:dgamr_, libslatec), Cdouble, (Ref{Float64},), x)
end

function cgamr(x::ComplexF32)
    ccall((:cgamr_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    alngam(x::Float32)
    alngam(x::Float64)
    alngam(z::ComplexF32)

Log abs gamma.

Formula: `ln |gamma(x)|`

Fortran Name: `ALNGAM(X)`, `DLNGAM(X)`
"""
function alngam(x::Float32)
    ccall((:alngam_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dlngam(x::Float64)
    ccall((:dlngam_, libslatec), Cdouble, (Ref{Float64},), x)
end

function clngam(z::ComplexF32)
    ccall((:clngam_, libslatec), ComplexF32, (Ref{ComplexF32},), z)
end

"""
    algams(x::Float32)
    algams(x::Float64)

Log abs gamma with sign.

Formula: `g = ln |gamma(x)|, s = sign gamma(x)`

- `x`:   Argument

Return:
- `g`:   Log absolute gamma
- `s`:   Sign of gamma, `+1.0` or `-1.0`

Fortran Name: `ALGAMS(X`, `G`, `S)`, `DLGAMS(X`, `G`, `S)`
"""
function algams(x::Float32)
    loggam, sgn = Ref{Float32}(NaN32), Ref{Float32}(NaN32)
    ccall((:algams_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Float32}),
        x, loggam, sgn)
    loggam[], sgn[]
end

function dlgams(x::Float64)
    loggam, sgn = Ref{Float64}(NaN), Ref{Float64}(NaN)
    ccall((:dlgams_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Float64}),
        x, loggam, sgn)
    loggam[], sgn[]
end

"""
    gami(a::Float32, x::Float32)
    gami(a::Float64, x::Float64)

Incomplete gamma.

Formula: `gamma(a,x) = integral from 0 to x of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMI(A`, `X)`, `DGAMI(A`, `X)`
"""
function gami(a::Float32, x::Float32)
    ccall((:gami_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

function dgami(a::Float64, x::Float64)
    ccall((:dgami_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
    gamic(a::Float32, x::Float32)
    gamic(a::Float64, x::Float64)

Complementary incomplete gamma.

Formula: `gamma(a,x) = integral from x to infinity of (t**(a-1) * e**-t)dt`

Fortran Name: `GAMIC(A`, `X)`, `DGAMIC(A`, `X)`
"""
function gamic(a::Float32, x::Float32)
    ccall((:gamic_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

function dgamic(a::Float64, x::Float64)
    ccall((:dgamic_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
    gamit(a::Float32, x::Float32)
    gamit(a::Float64, x::Float64)

Tricomi's incomplete gamma.

Formula: `gamma*(a,x) = x**-a * incomplete gamma(a,x) / gamma(a)`

Fortran Name: `GAMIT(A`, `X)`, `DGAMIT(A`, `X)`
"""
function gamit(a::Float32, x::Float32)
    ccall((:gamit_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

function dgamit(a::Float64, x::Float64)
    ccall((:dgamit_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
    psi(x::Float32)
    psi(x::Float64)
    psi(x::ComplexF32)

Psi (Digamma).

Formula: `psi(x) = gamma'(x) / gamma(x)`

Fortran Name: `PSI(X)`, `DPSI(X)`, `CPSI(X)`
"""
function psi(x::Float32)
    ccall((:psi_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dpsi(x::Float64)
    ccall((:dpsi_, libslatec), Cdouble, (Ref{Float64},), x)
end

function cpsi(x::ComplexF32)
    ccall((:cpsi_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

"""
    poch(a::Float32, x::Float32)
    poch(a::Float64, x::Float64)

Pochhammer's generalized symbol.

Formula: `(a) sub x = gamma(a+x) / gamma(a)`

Fortran Name: `POCH(A`, `X)`, `DPOCH(A`, `X)`
"""
function poch(a::Float32, x::Float32)
    ccall((:poch_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

function dpoch(a::Float64, x::Float64)
    ccall((:dpoch_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
    poch1(a::Float32, x::Float32)
    poch1(a::Float64, x::Float64)

Pochhammer's symbol from first order.

Formula: `((a) sub x -1) / x`

Fortran Name: `POCH1(A`, `X)`, `DPOCH1(A`, `X)`
"""
function poch1(a::Float32, x::Float32)
    ccall((:poch1_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, x)
end

function dpoch1(a::Float64, x::Float64)
    ccall((:dpoch1_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, x)
end

"""
    beta(a::Float32, b::Float32)
    beta(a::Float64, b::Float64)
    beta(a::ComplexF32, b::ComplexF32)

Beta.

Formula: `b(a,b) = (gamma(a) * gamma(b)) / gamma(a+b)`
= integral from 0 to 1 of (t**(a-1) * (1-t)**(b-1))dt

Fortran Name: `BETA(A`, `B)`, `DBETA(A`, `B)`, `CBETA(A`, `B)`
"""
function beta(a::Float32, b::Float32)
    ccall((:beta_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, b)
end

function dbeta(a::Float64, b::Float64)
    ccall((:dbeta_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, b)
end

function cbeta(a::ComplexF32, b::ComplexF32)
    ccall((:cbeta_, libslatec), ComplexF32, (Ref{ComplexF32}, Ref{ComplexF32}), a, b)
end

"""
    albeta(a::Float32, b::Float32)
    albeta(a::Float64, b::Float64)
    albeta(a::ComplexF32, b::ComplexF32)

Log beta.

Formula: `ln b(a,b)`

Fortran Name: `ALBETA(A`, `B)`, `DLBETA(A`, `B)`, `CLBETA(A`, `B)`
"""
function albeta(a::Float32, b::Float32)
    ccall((:albeta_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}), a, b)
end

function dlbeta(a::Float64, b::Float64)
    ccall((:dlbeta_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}), a, b)
end

function clbeta(a::ComplexF32, b::ComplexF32)
    ccall((:clbeta_, libslatec), ComplexF32, (Ref{ComplexF32}, Ref{ComplexF32}), a, b)
end

"""
    betai(x::Float32, a::Float32, b::Float32)
    betai(x::Float64, a::Float64, b::Float64)

Incomplete beta.

Formula: `i sub x (a,b) = b sub x (a,b) / b(a,b)`
= 1 / b(a,b) * integral from 0 to x of (t**(a-1) * (1-t)**(b-1))dt
Fortran Name: `BETAI(X`, `A`, `B)`, `DBETAI(X`, `A`, `B)`
"""
function betai(x::Float32, a::Float32, b::Float32)
    ccall((:betai_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}, Ref{Float32}), x, a, b)
end

function dbetai(x::Float64, a::Float64, b::Float64)
    ccall((:dbetai_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}, Ref{Float64}), x, a, b)
end

"""
    r9lgmc(x::Float32)
    r9lgmc(x::Float64)
    r9lgmc(x::ComplexF32)

Log gamma correction term.

Formula: `ln gamma(x) - (ln(2 * pi))/2 - (x - 1/2) * ln(x) + x`

Fortran Name: `R9LGMC(X)`, `D9LGMC(X)`, `C9LGMC(X)`
"""
function r9lgmc(x::Float32)
    ccall((:r9lgmc_, libslatec), Cfloat, (Ref{Float32},), x)
end

function d9lgmc(x::Float64)
    ccall((:d9lgmc_, libslatec), Cdouble, (Ref{Float64},), x)
end

function c9lgmc(x::ComplexF32)
    ccall((:c9lgmc_, libslatec), ComplexF32, (Ref{ComplexF32},), x)
end

#= --- Error Functions and Fresnel Integrals --- =#

"""
    erf(x::Float32)
    erf(x::Float64)

Error function.

Formula: `erf x = (2 / square root of pi) * the integral from 0 to x of e**(-t**2)dt`

Fortran Name: `ERF(X)`, `DERF(X)`
"""
function erf(x::Float32)
    ccall((:erf_, libslatec), Cfloat, (Ref{Float32},), x)
end

function derf(x::Float64)
    ccall((:derf_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    erfc(x::Float32)
    erfc(x::Float64)

Complementary error function.

Formula: `erfc x = (2 / square root of pi) * the integral from x to infinity of e**(-t**2)dt`

Fortran Name: `ERFC(X)`, `DERFC(X)`
"""
function erfc(x::Float32)
    ccall((:erfc_, libslatec), Cfloat, (Ref{Float32},), x)
end

function derfc(x::Float64)
    ccall((:derfc_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    daws(x::Float32)
    daws(x::Float64)

Dawson's function.

Formula: `F(x) = e**(-x**2) * the integral from 0 to x of e**(t**2)dt`

Fortran Name: `DAWS(X)`, `DDAWS(X)`
"""
function daws(x::Float32)
    ccall((:daws_, libslatec), Cfloat, (Ref{Float32},), x)
end

function ddaws(x::Float64)
    ccall((:ddaws_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Bessel Functions --- =#

"""
    besj0(x::Float32)
    besj0(x::Float64)

Bessel function of the first kind, order zero.

Formula: `J sub 0 (x)`

Fortran Name: `BESJ0(X)`, `DBESJ0(X)`
"""
function besj0(x::Float32)
    ccall((:besj0_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesj0(x::Float64)
    ccall((:dbesj0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besj1(x::Float32)
    besj1(x::Float64)

Bessel function of the first kind, order one.

Formula: `J sub 1 (x)`

Fortran Name: `BESJ1(X)`, `DBESJ1(X)`
"""
function besj1(x::Float32)
    ccall((:besj1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesj1(x::Float64)
    ccall((:dbesj1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besy0(x::Float32)
    besy0(x::Float64)

Bessel function of the second kind, order zero.

Formula: `Y sub 0 (x)`

Fortran Name: `BESY0(X)`, `DBESY0(X)`
"""
function besy0(x::Float32)
    ccall((:besy0_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesy0(x::Float64)
    ccall((:dbesy0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besy1(x::Float32)
    besy1(x::Float64)

Bessel function of the second kind, order one.

Formula: `Y sub 1 (x)`

Fortran Name: `BESY1(X)`, `DBESY1(X)`
"""
function besy1(x::Float32)
    ccall((:besy1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesy1(x::Float64)
    ccall((:dbesy1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besi0(x::Float32)
    besi0(x::Float64)

Modified Bessel function of the first kind, order zero.

Formula: `I sub 0 (x)`

Fortran Name: `BESI0(X)`, `DBESI0(X)`
"""
function besi0(x::Float32)
    ccall((:besi0_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesi0(x::Float64)
    ccall((:dbesi0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besi1(x::Float32)
    besi1(x::Float64)

Modified Bessel function of the first kind, order one.

Formula: `I sub 1 (x)`

Fortran Name: `BESI1(X)`, `DBESI1(X)`
"""
function besi1(x::Float32)
    ccall((:besi1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesi1(x::Float64)
    ccall((:dbesi1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besk0(x::Float32)
    besk0(x::Float64)

Modified Bessel function of the third kind, order zero.

Formula: `K sub 0 (x)`

Fortran Name: `BESK0(X)`, `DBESK0(X)`
"""
function besk0(x::Float32)
    ccall((:besk0_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesk0(x::Float64)
    ccall((:dbesk0_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besk1(x::Float32)
    besk1(x::Float64)

Modified Bessel function of the third kind, order one.

Formula: `K sub 1 (x)`

Fortran Name: `BESK1(X)`, `DBESK1(X)`
"""
function besk1(x::Float32)
    ccall((:besk1_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbesk1(x::Float64)
    ccall((:dbesk1_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besi0e(x::Float32)
    besi0e(x::Float64)

Modified Bessel function of the first kind, order zero, scaled.

Formula: `e**-|x| * I sub 0(x)`

Fortran Name: `BESI0E(X)`, `DBSI0E(X)`
"""
function besi0e(x::Float32)
    ccall((:besi0e_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbsi0e(x::Float64)
    ccall((:dbsi0e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besi1e(x::Float32)
    besi1e(x::Float64)

Modified Bessel function of the first kind, order one, scaled.

Formula: `e**-|x| * I sub 1(x)`

Fortran Name: `BESI1E(X)`, `DBSI1E(X)`
"""
function besi1e(x::Float32)
    ccall((:besi1e_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbsi1e(x::Float64)
    ccall((:dbsi1e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besk0e(x::Float32)
    besk0e(x::Float64)

Modified Bessel function of the third kind, order zero, scaled.

Formula: `e**x * K sub 0 (x)`

Fortran Name: `BESK0E(X)`, `DBSK0E(X)`
"""
function besk0e(x::Float32)
    ccall((:besk0e_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbsk0e(x::Float64)
    ccall((:dbsk0e_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    besk1e(x::Float32)
    besk1e(x::Float64)

Modified Bessel function of the third kind, order one, scaled.

Formula: `e**x * K sub 1 (x)`

Fortran Name: `BESK1E(X)`, `DBSK1E(X)`
"""
function besk1e(x::Float32)
    ccall((:besk1e_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbsk1e(x::Float64)
    ccall((:dbsk1e_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= Sequences of Bessel functions

- besi, dbesi
- besj, dbesj
- besk, dbesk
- besy, dbesy
- besks, dbesks
- beskes, dbeskes
=#

"""
    besi(x::Float32, alpha::Float32, kode::Int32, n::Int32)
    besi(x::Float64, alpha::Float64, kode::Int32, n::Int32)

Sequence of modified Bessel functions of the first kind.

Formula: ``I_{a+k-1}(x), k = 1,2,...,N``.  Optional scaling by `exp(-x)`.

- `x`:       `x >= 0`
- `alpha`:   Order of first member of the sequence, `alpha >= 0`
- `kode`:    Selection parameter (1=unscaled, 2=scaled)
- `n`:       Number of members in the sequence, `n >= 1`

Return `(y, nz)`
- `y`:       Result array
- `nz`:      Number of underflows

Fortran Name: `BESI(X,ALPHA,KODE,N, Y(*),NZ)`, `DBESI(X,ALPHA,KODE,N, Y(*),NZ)`
"""
function besi(x::Float32, alpha::Float32, kode::Int32, n::Int32)
    y = Vector{Float32}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:besi_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ref{Int32}, Ptr{Float32}, Ref{Int32}), x, alpha, kode, n, y, nz)
    return y, nz[]
end

function dbesi(x::Float64, alpha::Float64, kode::Int32, n::Int32)
    y = Vector{Float64}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:dbesi_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ref{Int32}, Ptr{Float64}, Ref{Int32}), x, alpha, kode, n, y, nz)
    return y, nz[]
end

"""
    besj(x::Float32, alpha::Float32, n::Int32)
    besj(x::Float64, alpha::Float64, n::Int32)

Sequence of Bessel functions of the first kind.

Formula: ``J_{a+k-1}(x), k = 1,2,...,N``

- `x`:       `x >= 0`
- `alpha`:   Order of first member of the sequence, `alpha >= 0`
- `n`:       Number of members in the sequence, `n >= 1`

Return `(y, nz)`
- `y`:       Result array
- `nz`:      Number of underflows

Fortran Name: `BESJ(X,ALPHA,N, Y(*),NZ)`, `DBESJ(X,ALPHA,N, Y(*),NZ)`
"""
function besj(x::Float32, alpha::Float32, n::Int32)
    y = Vector{Float32}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:besj_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ptr{Float32}, Ref{Int32}), x, alpha, n, y, nz)
    return y, nz[]
end

function dbesj(x::Float64, alpha::Float64, n::Int32)
    y = Vector{Float64}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:dbesj_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ptr{Float64}, Ref{Int32}), x, alpha, n, y, nz)
    return y, nz[]
end

"""
    besy(x::Float32, fnu::Float32, n::Int32)
    besy(x::Float64, fnu::Float64, n::Int32)

Sequence of Bessel functions of the second kind.

Formula: ``Y_{a+k-1}(x), k = 1,2,...,N``

- `x`:      `x >= 0`
- `fnu`:   Order of first member of the sequence, `fnu >= 0`
- `n`:     Number of members in the sequence, `n >= 1`

Return
- `y`:     Result array

Fortran Name: `BESY(X,FNU,N, Y(*))`, `DBESY(X,FNU,N, Y(*))`
"""
function besy(x::Float32, fnu::Float32, n::Int32)
    y = Vector{Float32}(undef, n)
    ccall((:besy_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ptr{Float32}), x, fnu, n, y)
    return y
end

function dbesy(x::Float64, fnu::Float64, n::Int32)
    y = Vector{Float64}(undef, n)
    ccall((:dbesy_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ptr{Float64}), x, fnu, n, y)
    return y
end

"""
    besk(x::Float32, fnu::Float32, kode::Int32, n::Int32)
    besk(x::Float64, fnu::Float64, kode::Int32, n::Int32)

Sequence of modified Bessel functions of the third kind.

Formula: ``K_{a+k-1}(x), k = 1,2,...,N``. Optional scaling by `exp(x)`.

- `x`:      `x >= 0`
- `fnu`:    Order of first member of the sequence, `fnu >= 0`
- `kode`:   Selection parameter (1=unscaled, 2=scaled)
- `n`:      Number of members in the sequence, `n >= 1`

Return `(y, nz)`
- `y`:      Result array
- `nz`:     Number of underflows

Fortran Name: `BESK(X,FNU,KODE,N, Y(*),NZ)`, `DBESK(X,FNU,KODE,N, Y(*),NZ)`
"""
function besk(x::Float32, fnu::Float32, kode::Int32, n::Int32)
    y = Vector{Float32}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:besk_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ref{Int32}, Ptr{Float32}, Ref{Int32}), x, fnu, kode, n, y, nz)
    return y, nz[]
end

function dbesk(x::Float64, fnu::Float64, kode::Int32, n::Int32)
    y = Vector{Float64}(undef, n)
    nz = Ref{Int32}(0)
    ccall((:dbesk_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ref{Int32}, Ptr{Float64}, Ref{Int32}), x, fnu, kode, n, y, nz)
    return y, nz[]
end

"""
    besks(xnu::Float32, x::Float32, n::Int32)
    besks(xnu::Float64, x::Float64, n::Int32)

Sequence of modified Bessel functions of the third kind.

Formula:
``K_{a+i}(x), i = 0, 1, ..., N-1`` for `N > 0`
or `i = 0, -1, ..., N+1` for `N < 0`.

- `xnu`:   Order of first member of the sequence, `xnu >= 0`
- `x`:     Argument, `x >= 0`
- `n`:     Number of members in the sequence, `n >= 1`

Return
- `bk`:    Result array

Fortran Name: `BESKS(XNU,X,N, BK(*))`, `DBESKS(XNU,X,N, BK(*))`
"""
function besks(xnu::Float32, x::Float32, n::Int32)
    bk = Vector{Float32}(undef, abs(n))
    ccall((:besks_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ptr{Float32}), xnu, x, n, bk)
    return bk
end

function dbesks(xnu::Float64, x::Float64, n::Int32)
    bk = Vector{Float64}(undef, abs(n))
    ccall((:dbesks_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ptr{Float64}), xnu, x, n, bk)
    return bk
end

"""
    beskes(xnu::Float32, x::Float32, n::Int32)
    beskes(xnu::Float64, x::Float64, n::Int32)

Sequence of modified Bessel functions of the third kind, scaled.

Formula:
``e^x * K_{a+i}(x), i = 0, 1, ..., N-1`` for `N > 0`
or `i = 0, -1, ..., N+1` for `N < 0`.

- `xnu`:   Order of first member of the sequence, `xnu >= 0`
- `x`:     Argument, `x >= 0`
- `n`:     Number of members in the sequence, `n >= 1`

Return
- `bk`:    Result array

Fortran Name: `BESKES(XNU,X,N, BK(*))`, `DBSKES(XNU,X,N, BK(*))`
"""
function beskes(xnu::Float32, x::Float32, n::Int32)
    bk = Vector{Float32}(undef, abs(n))
    ccall((:beskes_, libslatec), Cvoid, (Ref{Float32}, Ref{Float32}, Ref{Int32}, Ptr{Float32}), xnu, x, n, bk)
    return bk
end

function dbskes(xnu::Float64, x::Float64, n::Int32)
    bk = Vector{Float64}(undef, abs(n))
    ccall((:dbskes_, libslatec), Cvoid, (Ref{Float64}, Ref{Float64}, Ref{Int32}, Ptr{Float64}), xnu, x, n, bk)
    return bk
end

#= --- Bessel Functions of Fractional Order --- =#

"""
    ai(x::Float32)
    ai(x::Float64)

Airy function Ai.

Formula: `Ai(x)`

Fortran Name: `AI(X)`, `DAI(X)`
"""
function ai(x::Float32)
    ccall((:ai_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dai(x::Float64)
    ccall((:dai_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    bi(x::Float32)
    bi(x::Float64)

Airy function Bi.

Formula: `Bi(x)`

Fortran Name: `BI(X)`, `DBI(X)`
"""
function bi(x::Float32)
    ccall((:bi_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbi(x::Float64)
    ccall((:dbi_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    aie(x::Float32)
    aie(x::Float64)

Exponentially scaled Airy function Ai.

Formula: `Ai(x), x <= 0; exp(2/3 * x**(3/2)) * Ai(x), x >= 0`

Fortran Name: `AIE(X)`, `DAIE(X)`
"""
function aie(x::Float32)
    ccall((:aie_, libslatec), Cfloat, (Ref{Float32},), x)
end

function daie(x::Float64)
    ccall((:daie_, libslatec), Cdouble, (Ref{Float64},), x)
end

"""
    bie(x::Float32)
    bie(x::Float64)

Exponentially scaled Airy function Bi.

Formula: `Bi(x), x <= 0; exp(-2/3 * x**(3/2)) * Bi(x), x >= 0`

Fortran Name: `BIE(X)`, `DBIE(X)`
"""
function bie(x::Float32)
    ccall((:bie_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dbie(x::Float64)
    ccall((:dbie_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Confluent Hypergeometric Functions --- =#

"""
    chu(a::Float32, b::Float32, x::Float32)
    chu(a::Float64, b::Float64, x::Float64)

Confluent hypergeometric function.

Formula: `U(a,b,x)`

This routine is not valid when `1+A-B` is close to zero if X is small.

Fortran Name: `CHU(A`, `B`, `X)`, `DCHU(A`, `B`, `X)`
"""
function chu(a::Float32, b::Float32, x::Float32)
    ccall((:chu_, libslatec), Cfloat, (Ref{Float32}, Ref{Float32}, Ref{Float32}), a, b, x)
end

function dchu(a::Float64, b::Float64, x::Float64)
    ccall((:dchu_, libslatec), Cdouble, (Ref{Float64}, Ref{Float64}, Ref{Float64}), a, b, x)
end

#= --- Miscellaneous Functions --- =#

"""
    spenc(x::Float32)
    spenc(x::Float64)

Spence dilogarithm.

Formula: `s(x) = - the integral from 0 to x of ((ln |1-y|) / y)dy`

Fortran Name: `SPENC(X)`, `DSPENC(X)`
"""
function spenc(x::Float32)
    ccall((:spenc_, libslatec), Cfloat, (Ref{Float32},), x)
end

function dspenc(x::Float64)
    ccall((:dspenc_, libslatec), Cdouble, (Ref{Float64},), x)
end

#= --- Forwarding functions for Float64 --- =#

# Intrinsic Functions and Fundamental Functions
r9upak(x::Float64) = d9upak(x)
r9pak(y::Float64, n::Int32) = d9pak(y, n)
inits(os::Vector{Float64}, eta::Float64) = initds(os, eta)
csevl(x::Float64, cs::Vector{Float64}) = dcsevl(x, cs)
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
besi(x::Float64, alpha::Float64, kode::Int32, n::Int32) = dbesi(x, alpha, kode, n)
besj(x::Float64, alpha::Float64, n::Int32) = dbesj(x, alpha, n)
besy(x::Float64, fnu::Float64, n::Int32) = dbesy(x, fnu, n)
besk(x::Float64, fnu::Float64, kode::Int32, n::Int32) = dbesk(x, fnu, kode, n)
besks(xnu::Float64, x::Float64, n::Int32) = dbesks(xnu, x, n)
beskes(xnu::Float64, x::Float64, n::Int32) = dbskes(xnu, x, n)
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
