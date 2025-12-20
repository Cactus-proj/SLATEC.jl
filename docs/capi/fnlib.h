// SPDX-License-Identifier: MIT
#pragma once
#ifndef FNLIB_H
/**
 * FNLIB C Interface Header.
 *
 * FNLIB: a collection of routines for evaluating elementary and special functions.
 * Generated from SLATEC documentation: `fundoc.f`
 */
#define FNLIB_H

#ifdef __cplusplus
extern "C" {
#endif

typedef float real;
typedef double doublereal;
typedef int integer;
typedef struct { real r, i; } complex;
// typedef struct { doublereal r, i; } doublecomplex;


/* --- Intrinsic Functions and Fundamental Functions --- */

/**
 * Unpack a floating point number X so that `X = Y * 2^N`,
 *  where `Y` is between 0.5 and 1.0.
 *
 * Fortran Name: R9UPAK(X, Y,N), D9UPAK(X, Y,N)
 * @param[in]  x  Input floating point number
 * @param[out] y  Mantissa
 * @param[out] n  Exponent
 */
void r9upak_(const real *x, real *y, integer *n);
void d9upak_(const doublereal *x, doublereal *y, integer *n);

/**
 * Pack a base 2 exponent into a floating point number.
 *
 * Fortran Name: R9PAK(Y,N), D9PAK(Y,N)
 * @param[in]  y  Mantissa
 * @param[in]  n  Exponent
 * @return        Packed floating point number
 */
real r9pak_(const real *y, const integer *n);
doublereal d9pak_(const doublereal *y, const integer *n);

/**
 * Determine the number of terms needed in an orthogonal
 *  polynomial series so that it meets a specified accuracy.
 *
 * Fortran Name: INITS(OS,NOS,ETA), INITDS(OS,NOS,ETA)
 * @param[in]  os   Coefficients in an orthogonal series.
 * @param[in]  nos  Number of coefficients in `os`.
 * @param[in]  eta  Requested accuracy of the series.
 * @return          Number of terms needed to meet the accuracy.
 */
integer inits_(const real *os, const integer *nos, const real *eta);
integer initds_(const doublereal *os, const integer *nos, const doublereal *eta);

/**
 * Evaluate Chebyshev series.
 *
 * Formula: summation for i = 1 to n of cs(i)*(2*x)**(i-1)
 * Fortran Name: CSEVL(X,CS,N), DCSEVL(X,CS,N)
 * @param[in]  x  Input value
 * @param[in]  cs Coefficients in the Chebyshev series.
 * @param[in]  n  Number of coefficients in `cs`.
 * @return        Value of the Chebyshev series at `x`.
 */
real csevl_(const real *x, const real *cs, const integer *n);
doublereal dcsevl_(const doublereal *x, const doublereal *cs, const integer *n);

/* --- Elementary Functions --- */

/**
 * Argument = theta in radians.
 *
 * Formula: z = |z| * e**(i * theta)
 * Fortran Name: CARG(Z)
 */
real carg_(complex *z);

/**
 * Cube root.
 *
 * Fortran Name: CBRT(X), DCBRT(X), CCBRT(X)
 */
real cbrt_(real *x);
doublereal dcbrt_(doublereal *x);
complex ccbrt_(complex *x);

/**
 * Relative error exponential from first order.
 *
 * Formula: ((e**x) -1) / x
 * Fortran Name: EXPREL(X), DEXPRL(X), CEXPRL(X)
 */
real exprel_(real *x);
doublereal dexprl_(doublereal *x);
complex cexprl_(complex *x);

/**
 * Common logarithm.
 *
 * Formula: log to the base 10 of z
 * Fortran Name: CLOG10(Z)
 */
complex clog10_(complex *z);

/**
 * Relative error logarithm.
 *
 * Formula: ln(1 + x)
 * Fortran Name: ALNREL(X), DLNREL(X), CLNREL(X)
 */
real alnrel_(real *x);
doublereal dlnrel_(doublereal *x);
complex clnrel_(complex *x);

/**
 * Relative error logarithm from second order.
 *
 * Formula: (ln(1 + x) - x + x**2/2) / x**3
 * Fortran Name: R9LN2R(X), D9LN2R(X), C9LN2R(X)
 */
real r9ln2r_(real *x);
doublereal d9ln2r_(doublereal *x);
complex c9ln2r_(complex *x);

/* --- Trigonometric and Hyperbolic Functions --- */

/**
 * Tangent.
 *
 * Formula: tan z
 * Fortran Name: CTAN(Z)
 */
complex ctan_(complex *z);

/**
 * Cotangent.
 *
 * Formula: cot x
 * Fortran Name: COT(X), DCOT(X), CCOT(X)
 */
real cot_(real *x);
doublereal dcot_(doublereal *x);
complex ccot_(complex *x);

/**
 * Sine x in degrees.
 *
 * Formula: sin((2*pi*x)/360)
 * Fortran Name: SINDG(X), DSINDG(X)
 */
real sindg_(real *x);
doublereal dsindg_(doublereal *x);

/**
 * Cosine x in degrees.
 *
 * Formula: cos((2*pi*x)/360)
 * Fortran Name: COSDG(X), DCOSDG(X)
 */
real cosdg_(real *x);
doublereal dcosdg_(doublereal *x);

/**
 * Arc sine.
 *
 * Formula: arcsin (z)
 * Fortran Name: CASIN(Z)
 */
complex casin_(complex *z);

/**
 * Arc cosine.
 *
 * Formula: arccos (z)
 * Fortran Name: CACOS(Z)
 */
complex cacos_(complex *z);

/**
 * Arc tangent.
 *
 * Formula: arctan (z)
 * Fortran Name: CATAN(Z)
 */
complex catan_(complex *z);

/**
 * Quadrant correct arc tangent.
 *
 * Formula: arctan (z1/z2)
 * Fortran Name: CATAN2(Z1, Z2)
 */
complex catan2_(complex *z1, complex *z2);

/**
 * Hyperbolic sine.
 *
 * Formula: sinh z
 * Fortran Name: CSINH(Z)
 */
complex csinh_(complex *z);

/**
 * Hyperbolic cosine.
 *
 * Formula: cosh z
 * Fortran Name: CCOSH(Z)
 */
complex ccosh_(complex *z);

/**
 * Hyperbolic tangent.
 *
 * Formula: tanh z
 * Fortran Name: CTANH(Z)
 */
complex ctanh_(complex *z);

/**
 * Arc hyperbolic sine.
 *
 * Formula: arcsinh (x)
 * Fortran Name: ASINH(X), DASINH(X), CASINH(X)
 */
real asinh_(real *x);
doublereal dasinh_(doublereal *x);
complex casinh_(complex *x);

/**
 * Arc hyperbolic cosine.
 *
 * Formula: arccosh (x)
 * Fortran Name: ACOSH(X), DACOSH(X), CACOSH(X)
 */
real acosh_(real *x);
doublereal dacosh_(doublereal *x);
complex cacosh_(complex *x);

/**
 * Arc hyperbolic tangent.
 *
 * Formula: arctanh (x)
 * Fortran Name: ATANH(X), DATANH(X), CATANH(X)
 */
real atanh_(real *x);
doublereal datanh_(doublereal *x);
complex catanh_(complex *x);

/**
 * Relative error arc tangent from first order.
 *
 * Formula: (arctan (x) - x) / x**3
 * Fortran Name: R9ATN1(X), D9ATN1(X)
 */
real r9atn1_(real *x);
doublereal d9atn1_(doublereal *x);

/* --- Exponential Integrals and Related Functions --- */

/**
 * Exponential integral Ei(x).
 *
 * Formula: (minus) the integral from -x to infinity of (e**-t / t)dt
 * Fortran Name: EI(X), DEI(X)
 */
real ei_(real *x);
doublereal dei_(doublereal *x);

/**
 * Exponential integral E1(x).
 *
 * Formula: the integral from x to infinity of (e**-t / t) dt
 * Fortran Name: E1(X), DE1(X)
 */
real e1_(real *x);
doublereal de1_(doublereal *x);

/**
 * Logarithmic integral li(x).
 *
 * Formula: the integral from 0 to x of (1 / ln t) dt
 * Fortran Name: ALI(X), DLI(X)
 */
real ali_(real *x);
doublereal dli_(doublereal *x);

/**
 * Compute an `m` member sequence of Exponential integral ``E_{n+k}(x)``.
 *
 * Formula: the integral from 1 to infinity of (e**(-x*t)/t**(n+k))dt
 * Fortran Name: EXINT(X,N,KODE,M,TOL, EN,NZ,IERR), DEXINT(X,N,KODE,M,TOL, EN,NZ,IERR)
 * @param[in]  x     `x > 0 for n=1` and `x >= 0 for n >=2`
 * @param[in]  n     Order, `n >= 1`
 * @param[in]  kode  Selection parameter (1=normal, 2=scaled)
 * @param[in]  m     Number of terms to compute, `m >= 1`
 * @param[in]  tol   Relative accuracy wanted, `ETOL=R1MACH(4) < tol < 0.1`
 * @param[out] en    Result array
 * @param[out] nz    underflow indicator
 * @param[out] ierr  Error flag
 */
void exint_(const real *x, const integer *n, const integer *kode, const integer *m, const real *tol,
    real en[], integer *nz, integer *ierr);
void dexint_(const doublereal *x, const integer *n, const integer *kode, const integer *m, const doublereal *tol,
    doublereal en[], integer *nz, integer *ierr);

/* --- Gamma Functions and Related Functions --- */

/**
 * Factorial.
 *
 * Formula: n!
 * Fortran Name: FAC(N), DFAC(N)
 */
real fac_(integer *n);
doublereal dfac_(integer *n);

/**
 * Binomial.
 *
 * Formula: n!/(m!*(n-m)!)
 * Fortran Name: BINOM(N,M), DBINOM(N,M)
 */
real binom_(integer *n, integer *m);
doublereal dbinom_(integer *n, integer *m);

/**
 * Gamma.
 *
 * Formula: gamma(x)
 * Fortran Name: GAMMA(X), DGAMMA(X), CGAMMA(X)
 */
real gamma_(real *x);
doublereal dgamma_(doublereal *x);
complex cgamma_(complex *x);

/**
 * Gamma(x) under and overflow limits.
 *
 * Fortran Name: GAMLIM(XMIN,XMAX), DGAMLM(XMIN,XMAX)
 * @param[out] xmin  Minimum legal value of X in gamma(X)
 * @param[out] xmax  Maximum legal value of X in gamma(X)
 */
void gamlim_(real *xmin, real *xmax);
void dgamlm_(doublereal *xmin, doublereal *xmax);

/**
 * Reciprocal gamma.
 *
 * Formula: 1 / gamma(x)
 * Fortran Name: GAMR(X), DGAMR(X), CGAMR(X)
 */
real gamr_(real *x);
doublereal dgamr_(doublereal *x);
complex cgamr_(complex *x);

/**
 * Log abs gamma.
 *
 * Formula: ln |gamma(x)|
 * Fortran Name: ALNGAM(X), DLNGAM(X)
 */
real alngam_(real *x);
doublereal dlngam_(doublereal *x);

/**
 * Log gamma.
 *
 * Formula: ln gamma(z)
 * Fortran Name: CLNGAM(Z)
 */
complex clngam_(complex *z);

/**
 * Log abs gamma with sign.
 *
 * Formula: g = ln |gamma(x)|, s = sign gamma(x)
 * Fortran Name: ALGAMS(X, G,S), DLGAMS(X, G,S)
 * @param[in]  x  Argument
 * @param[out] g  Log absolute gamma
 * @param[out] s  Sign of gamma, `+1.0` or `-1.0`
 */
void algams_(const real *x, real *g, real *s);
void dlgams_(const doublereal *x, doublereal *g, doublereal *s);

/**
 * Incomplete gamma.
 *
 * Formula: gamma(a,x) = integral from 0 to x of (t**(a-1) * e**-t)dt
 * Fortran Name: GAMI(A,X), DGAMI(A,X)
 */
real gami_(real *a, real *x);
doublereal dgami_(doublereal *a, doublereal *x);

/**
 * Complementary incomplete gamma.
 *
 * Formula: gamma(a,x) = integral from x to infinity of (t**(a-1) * e**-t)dt
 * Fortran Name: GAMIC(A,X), DGAMIC(A,X)
 */
real gamic_(real *a, real *x);
doublereal dgamic_(doublereal *a, doublereal *x);

/**
 * Tricomi's incomplete gamma.
 *
 * Formula: gamma*(a,x) = x**-a * incomplete gamma(a,x) / gamma(a)
 * Fortran Name: GAMIT(A,X), DGAMIT(A,X)
 */
real gamit_(real *a, real *x);
doublereal dgamit_(doublereal *a, doublereal *x);

/**
 * Psi (Digamma).
 *
 * Formula: psi(x) = gamma'(x) / gamma(x)
 * Fortran Name: PSI(X), DPSI(X), CPSI(X)
 */
real psi_(real *x);
doublereal dpsi_(doublereal *x);
complex cpsi_(complex *x);

/**
 * Pochhammer's generalized symbol.
 *
 * Formula: (a) sub x = gamma(a+x) / gamma(a)
 * Fortran Name: POCH(A,X), DPOCH(A,X)
 */
real poch_(real *a, real *x);
doublereal dpoch_(doublereal *a, doublereal *x);

/**
 * Pochhammer's symbol from first order.
 *
 * Formula: ((a) sub x -1) / x
 * Fortran Name: POCH1(A,X), DPOCH1(A,X)
 */
real poch1_(real *a, real *x);
doublereal dpoch1_(doublereal *a, doublereal *x);

/**
 * Beta.
 *
 * Formula: b(a,b) = (gamma(a) * gamma(b)) / gamma(a+b)
 *          = integral from 0 to 1 of (t**(a-1) * (1-t)**(b-1))dt
 * Fortran Name: BETA(A,B), DBETA(A,B), CBETA(A,B)
 */
real beta_(real *a, real *b);
doublereal dbeta_(doublereal *a, doublereal *b);
complex cbeta_(complex *a, complex *b);

/**
 * Log beta.
 *
 * Formula: ln b(a,b)
 * Fortran Name: ALBETA(A,B), DLBETA(A,B), CLBETA(A,B)
 */
real albeta_(real *a, real *b);
doublereal dlbeta_(doublereal *a, doublereal *b);
complex clbeta_(complex *a, complex *b);

/**
 * Incomplete beta.
 *
 * Formula: i sub x (a,b) = b sub x (a,b) / b(a,b)
 *          = 1 / b(a,b) * integral from 0 to x of (t**(a-1) * (1-t)**(b-1))dt
 * Fortran Name: BETAI(X,A,B), DBETAI(X,A,B)
 */
real betai_(real *x, real *a, real *b);
doublereal dbetai_(doublereal *x, doublereal *a, doublereal *b);

/**
 * Log gamma correction term.
 *
 * Formula: ln gamma(x) - (ln(2 * pi))/2 - (x - 1/2) * ln(x) + x
 * Fortran Name: R9LGMC(X), D9LGMC(X), C9LGMC(X)
 */
real r9lgmc_(real *x);
doublereal d9lgmc_(doublereal *x);
complex c9lgmc_(complex *x);

/* --- Error Functions and Fresnel Integrals --- */

/**
 * Error function.
 *
 * Formula: erf x = (2 / square root of pi) * the integral from 0 to x of e**(-t**2)dt
 * Fortran Name: ERF(X), DERF(X)
 */
real erf_(real *x);
doublereal derf_(doublereal *x);

/**
 * Complementary error function.
 *
 * Formula: erfc x = (2 / square root of pi) * the integral from x to infinity of e**(-t**2)dt
 * Fortran Name: ERFC(X), DERFC(X)
 */
real erfc_(real *x);
doublereal derfc_(doublereal *x);

/**
 * Dawson's function.
 *
 * Formula: F(x) = e**(-x**2) * the integral from 0 to x of e**(t**2)dt
 * Fortran Name: DAWS(X), DDAWS(X)
 */
real daws_(real *x);
doublereal ddaws_(doublereal *x);

/* --- Bessel Functions --- */

/**
 * Bessel function of the first kind, order zero.
 *
 * Formula: J sub 0 (x)
 * Fortran Name: BESJ0(X), DBESJ0(X)
 */
real besj0_(real *x);
doublereal dbesj0_(doublereal *x);

/**
 * Bessel function of the first kind, order one.
 *
 * Formula: J sub 1 (x)
 * Fortran Name: BESJ1(X), DBESJ1(X)
 */
real besj1_(real *x);
doublereal dbesj1_(doublereal *x);

/**
 * Bessel function of the second kind, order zero.
 *
 * Formula: Y sub 0 (x)
 * Fortran Name: BESY0(X), DBESY0(X)
 */
real besy0_(real *x);
doublereal dbesy0_(doublereal *x);

/**
 * Bessel function of the second kind, order one.
 *
 * Formula: Y sub 1 (x)
 * Fortran Name: BESY1(X), DBESY1(X)
 */
real besy1_(real *x);
doublereal dbesy1_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order zero.
 *
 * Formula: I sub 0 (x)
 * Fortran Name: BESI0(X), DBESI0(X)
 */
real besi0_(real *x);
doublereal dbesi0_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order one.
 *
 * Formula: I sub 1 (x)
 * Fortran Name: BESI1(X), DBESI1(X)
 */
real besi1_(real *x);
doublereal dbesi1_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order zero.
 *
 * Formula: K sub 0 (x)
 * Fortran Name: BESK0(X), DBESK0(X)
 */
real besk0_(real *x);
doublereal dbesk0_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order one.
 *
 * Formula: K sub 1 (x)
 * Fortran Name: BESK1(X), DBESK1(X)
 */
real besk1_(real *x);
doublereal dbesk1_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order zero, scaled.
 *
 * Formula: e**-|x| * I sub 0(x)
 * Fortran Name: BESI0E(X), DBSI0E(X)
 */
real besi0e_(real *x);
doublereal dbsi0e_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order one, scaled.
 *
 * Formula: e**-|x| * I sub 1(x)
 * Fortran Name: BESI1E(X), DBSI1E(X)
 */
real besi1e_(real *x);
doublereal dbsi1e_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order zero, scaled.
 *
 * Formula: e**x * K sub 0 (x)
 * Fortran Name: BESK0E(X), DBSK0E(X)
 */
real besk0e_(real *x);
doublereal dbsk0e_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order one, scaled.
 *
 * Formula: e**x * K sub 1 (x)
 * Fortran Name: BESK1E(X), DBSK1E(X)
 */
real besk1e_(real *x);
doublereal dbsk1e_(doublereal *x);

/* Sequences of Bessel functions */

/**
 * Sequence of modified Bessel functions of the first kind.
 *
 * Formula: ``I_{a+k-1}(x), k = 1,2,...,N``.  Optional scaling by `exp(-x)`.
 * Fortran Name: BESI(X,ALPHA,KODE,N, Y(*),NZ), DBESI(X,ALPHA,KODE,N, Y(*),NZ)
 * @param[in]  x      `x >= 0`
 * @param[in]  alpha  Order of first member of the sequence, `alpha >= 0`
 * @param[in]  kode   Selection parameter (1=unscaled, 2=scaled)
 * @param[in]  n      Number of members in the sequence, `n >= 1`
 * @param[out] y      Result array
 * @param[out] nz     Number of underflows
 */
void besi_(const real *x, const real *alpha, const integer *kode, const integer *n,
    real y[], integer *nz);
void dbesi_(const doublereal *x, const doublereal *alpha, const integer *kode, const integer *n,
    doublereal y[], integer *nz);

/**
 * Sequence of Bessel functions of the first kind.
 *
 * Formula: ``J_{a+k-1}(x), k = 1,2,...,N``
 * Fortran Name: BESJ(X,ALPHA,N, Y(*),NZ), DBESJ(X,ALPHA,N, Y(*),NZ)
 * @param[in]  x      `x >= 0`
 * @param[in]  alpha  Order of first member of the sequence, `alpha >= 0`
 * @param[in]  n      Number of members in the sequence, `n >= 1`
 * @param[out] y      Result array
 * @param[out] nz     Number of underflows
 */
void besj_(const real *x, const real *alpha, const integer *n,
    real y[], integer *nz);
void dbesj_(const doublereal *x, const doublereal *alpha, const integer *n,
    doublereal y[], integer *nz);

/**
 * Sequence of Bessel functions of the second kind.
 *
 * Formula: ``Y_{a+k-1}(x), k = 1,2,...,N``
 * Fortran Name: BESY(X,FNU,N, Y(*)), DBESY(X,FNU,N, Y(*))
 * @param[in]  x     `x >= 0`
 * @param[in]  fnu  Order of first member of the sequence, `fnu >= 0`
 * @param[in]  n    Number of members in the sequence, `n >= 1`
 * @param[out] y    Result array
 */
void besy_(const real *x, const real *fnu, const integer *n,
    real y[]);
void dbesy_(const doublereal *x, const doublereal *fnu, const integer *n,
    doublereal y[]);

/**
 * Sequence of modified Bessel functions of the third kind.
 *
 * Formula: ``K_{a+k-1}(x), k = 1,2,...,N``. Optional scaling by `exp(x)`.
 * Fortran Name: BESK(X,FNU,KODE,N, Y(*),NZ), DBESK(X,FNU,KODE,N, Y(*),NZ)
 * @param[in]  x     `x >= 0`
 * @param[in]  fnu   Order of first member of the sequence, `fnu >= 0`
 * @param[in]  kode  Selection parameter (1=unscaled, 2=scaled)
 * @param[in]  n     Number of members in the sequence, `n >= 1`
 * @param[out] y     Result array
 * @param[out] nz    Number of underflows
 */
void besk_(const real *x, const real *fnu, const integer *kode, const integer *n,
    real y[], integer *nz);
void dbesk_(const doublereal *x, const doublereal *fnu, const integer *kode, const integer *n,
    doublereal y[], integer *nz);

/**
 * Sequence of modified Bessel functions of the third kind.
 *
 * Formula:
 *      ``K_{a+i}(x), i = 0, 1, ..., N-1`` for `N > 0`
 *      or `i = 0, -1, ..., N+1` for `N < 0`.
 * Fortran Name: BESKS(XNU,X,N, BK(*)), DBESKS(XNU,X,N, BK(*))
 * @param[in]  xnu  Order of first member of the sequence, `xnu >= 0`
 * @param[in]  x    Argument, `x >= 0`
 * @param[in]  n    Number of members in the sequence, `n >= 1`
 * @param[out] bk   Result array
 */
void besks_(const real *xnu, const real *x, const integer *n,
    real bk[]);
void dbesks_(const doublereal *xnu, const doublereal *x, const integer *n,
    doublereal bk[]);

/**
 * Sequence of modified Bessel functions of the third kind, scaled.
 *
 * Formula:
 *      ``e^x * K_{a+i}(x), i = 0, 1, ..., N-1`` for `N > 0`
 *      or `i = 0, -1, ..., N+1` for `N < 0`.
 * Fortran Name: BESKES(XNU,X,N, BK(*)), DBSKES(XNU,X,N, BK(*))
 * @param[in]  xnu  Order of first member of the sequence, `xnu >= 0`
 * @param[in]  x    Argument, `x >= 0`
 * @param[in]  n    Number of members in the sequence, `n >= 1`
 * @param[out] bk   Result array
 */
void beskes_(const real *xnu, const real *x, const integer *n,
    real bk[]);
void dbskes_(const doublereal *xnu, const doublereal *x, const integer *n,
    doublereal bk[]);

/* --- Bessel Functions of Fractional Order --- */

/**
 * Airy function Ai.
 *
 * Formula: Ai(x)
 * Fortran Name: AI(X), DAI(X)
 */
real ai_(real *x);
doublereal dai_(doublereal *x);

/**
 * Airy function Bi.
 *
 * Formula: Bi(x)
 * Fortran Name: BI(X), DBI(X)
 */
real bi_(real *x);
doublereal dbi_(doublereal *x);

/**
 * Exponentially scaled Airy function Ai.
 *
 * Formula: Ai(x), x <= 0; exp(2/3 * x**(3/2)) * Ai(x), x >= 0
 * Fortran Name: AIE(X), DAIE(X)
 */
real aie_(real *x);
doublereal daie_(doublereal *x);

/**
 * Exponentially scaled Airy function Bi.
 *
 * Formula: Bi(x), x <= 0; exp(-2/3 * x**(3/2)) * Bi(x), x >= 0
 * Fortran Name: BIE(X), DBIE(X)
 */
real bie_(real *x);
doublereal dbie_(doublereal *x);

/* --- Confluent Hypergeometric Functions --- */

/**
 * Confluent hypergeometric function.
 *
 * Formula: U(a,b,x)
 * Fortran Name: CHU(A,B,X), DCHU(A,B,X)
 */
real chu_(real *a, real *b, real *x);
doublereal dchu_(doublereal *a, doublereal *b, doublereal *x);

/* --- Miscellaneous Functions --- */

/**
 * Spence dilogarithm.
 *
 * Formula: s(x) = - the integral from 0 to x of ((ln |1-y|) / y)dy
 * Fortran Name: SPENC(X), DSPENC(X)
 */
real spenc_(real *x);
doublereal dspenc_(doublereal *x);

#ifdef __cplusplus
}
#endif

#endif /* FNLIB_H */