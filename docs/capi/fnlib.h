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
 * Unpack floating point number.
 *
 * Fortran Name: R9UPAK, D9UPAK
 */
void r9upak_(real *x, real *y, integer *n);
void d9upak_(doublereal *x, doublereal *y, integer *n);

/**
 * Pack floating point number.
 *
 * Fortran Name: R9PAK, D9PAK
 */
real r9pak_(real *y, integer *n);
doublereal d9pak_(doublereal *y, integer *n);

/**
 * Initialize orthogonal polynomial series.
 *
 * Fortran Name: INITS, INITDS
 */
integer inits_(real *os, integer *nos, real *eta);
integer initds_(doublereal *os, integer *nos, doublereal *eta);

/**
 * Evaluate Chebyshev series.
 *
 * Formula: summation for i = 1 to n of cs(i)*(2*x)**(i-1)
 * Fortran Name: CSEVL, DCSEVL
 */
real csevl_(real *x, real *cs, integer *n);
doublereal dcsevl_(doublereal *x, doublereal *cs, integer *n);

/* --- Elementary Functions --- */

/**
 * Argument = theta in radians.
 *
 * Formula: z = |z| * e**(i * theta)
 * Fortran Name: CARG
 */
real carg_(complex *z);

/**
 * Cube root.
 *
 * Fortran Name: CBRT, DCBRT, CCBRT
 */
real cbrt_(real *x);
doublereal dcbrt_(doublereal *x);
complex ccbrt_(complex *x);

/**
 * Relative error exponential from first order.
 *
 * Formula: ((e**x) -1) / x
 * Fortran Name: EXPREL, DEXPRL, CEXPRL
 */
real exprel_(real *x);
doublereal dexprl_(doublereal *x);
complex cexprl_(complex *x);

/**
 * Common logarithm.
 *
 * Formula: log to the base 10 of z
 * Fortran Name: CLOG10
 */
complex clog10_(complex *z);

/**
 * Relative error logarithm.
 *
 * Formula: ln(1 + x)
 * Fortran Name: ALNREL, DLNREL, CLNREL
 */
real alnrel_(real *x);
doublereal dlnrel_(doublereal *x);
complex clnrel_(complex *x);

/**
 * Relative error logarithm from second order.
 *
 * Formula: (ln(1 + x) - x + x**2/2) / x**3
 * Fortran Name: R9LN2R, D9LN2R, C9LN2R
 */
real r9ln2r_(real *x);
doublereal d9ln2r_(doublereal *x);
complex c9ln2r_(complex *x);

/* --- Trigonometric and Hyperbolic Functions --- */

/**
 * Tangent.
 *
 * Formula: tan z
 * Fortran Name: CTAN
 */
complex ctan_(complex *z);

/**
 * Cotangent.
 *
 * Formula: cot x
 * Fortran Name: COT, DCOT, CCOT
 */
real cot_(real *x);
doublereal dcot_(doublereal *x);
complex ccot_(complex *x);

/**
 * Sine x in degrees.
 *
 * Formula: sin((2*pi*x)/360)
 * Fortran Name: SINDG, DSINDG
 */
real sindg_(real *x);
doublereal dsindg_(doublereal *x);

/**
 * Cosine x in degrees.
 *
 * Formula: cos((2*pi*x)/360)
 * Fortran Name: COSDG, DCOSDG
 */
real cosdg_(real *x);
doublereal dcosdg_(doublereal *x);

/**
 * Arc sine.
 *
 * Formula: arcsin (z)
 * Fortran Name: CASIN
 */
complex casin_(complex *z);

/**
 * Arc cosine.
 *
 * Formula: arccos (z)
 * Fortran Name: CACOS
 */
complex cacos_(complex *z);

/**
 * Arc tangent.
 *
 * Formula: arctan (z)
 * Fortran Name: CATAN
 */
complex catan_(complex *z);

/**
 * Quadrant correct arc tangent.
 *
 * Formula: arctan (z1/z2)
 * Fortran Name: CATAN2
 */
complex catan2_(complex *z1, complex *z2);

/**
 * Hyperbolic sine.
 *
 * Formula: sinh z
 * Fortran Name: CSINH
 */
complex csinh_(complex *z);

/**
 * Hyperbolic cosine.
 *
 * Formula: cosh z
 * Fortran Name: CCOSH
 */
complex ccosh_(complex *z);

/**
 * Hyperbolic tangent.
 *
 * Formula: tanh z
 * Fortran Name: CTANH
 */
complex ctanh_(complex *z);

/**
 * Arc hyperbolic sine.
 *
 * Formula: arcsinh (x)
 * Fortran Name: ASINH, DASINH, CASINH
 */
real asinh_(real *x);
doublereal dasinh_(doublereal *x);
complex casinh_(complex *x);

/**
 * Arc hyperbolic cosine.
 *
 * Formula: arccosh (x)
 * Fortran Name: ACOSH, DACOSH, CACOSH
 */
real acosh_(real *x);
doublereal dacosh_(doublereal *x);
complex cacosh_(complex *x);

/**
 * Arc hyperbolic tangent.
 *
 * Formula: arctanh (x)
 * Fortran Name: ATANH, DATANH, CATANH
 */
real atanh_(real *x);
doublereal datanh_(doublereal *x);
complex catanh_(complex *x);

/**
 * Relative error arc tangent from first order.
 *
 * Formula: (arctan (x) - x) / x**3
 * Fortran Name: R9ATN1, D9ATN1
 */
real r9atn1_(real *x);
doublereal d9atn1_(doublereal *x);

/* --- Exponential Integrals and Related Functions --- */

/**
 * Exponential integral Ei(x).
 *
 * Formula: (minus) the integral from -x to infinity of (e**-t / t)dt
 * Fortran Name: EI, DEI
 */
real ei_(real *x);
doublereal dei_(doublereal *x);

/**
 * Exponential integral E1(x).
 *
 * Formula: the integral from x to infinity of (e**-t / t) dt
 * Fortran Name: E1, DE1
 */
real e1_(real *x);
doublereal de1_(doublereal *x);

/**
 * Logarithmic integral li(x).
 *
 * Formula: the integral from 0 to x of (1 / ln t) dt
 * Fortran Name: ALI, DLI
 */
real ali_(real *x);
doublereal dli_(doublereal *x);

/**
 * Exponential integral E sub n+k (x).
 *
 * Formula: the integral from 1 to infinity of (e**(-x*t)/t**(n+k))dt
 * Fortran Name: EXINT, DEXINT
 */
void exint_(real *x, integer *n, integer *kode, integer *m, real *tol, real *en, integer *ierr);
void dexint_(doublereal *x, integer *n, integer *kode, integer *m, doublereal *tol, doublereal *en, integer *ierr);

/* --- Gamma Functions and Related Functions --- */

/**
 * Factorial.
 *
 * Formula: n!
 * Fortran Name: FAC, DFAC
 */
real fac_(integer *n);
doublereal dfac_(integer *n);

/**
 * Binomial.
 *
 * Formula: n!/(m!*(n-m)!)
 * Fortran Name: BINOM, DBINOM
 */
real binom_(integer *n, integer *m);
doublereal dbinom_(integer *n, integer *m);

/**
 * Gamma.
 *
 * Formula: gamma(x)
 * Fortran Name: GAMMA, DGAMMA, CGAMMA
 */
real gamma_(real *x);
doublereal dgamma_(doublereal *x);
complex cgamma_(complex *x);

/**
 * Gamma(x) under and overflow limits.
 *
 * Fortran Name: GAMLIM, DGAMLM
 */
void gamlim_(real *xmin, real *xmax);
void dgamlm_(doublereal *xmin, doublereal *xmax);

/**
 * Reciprocal gamma.
 *
 * Formula: 1 / gamma(x)
 * Fortran Name: GAMR, DGAMR, CGAMR
 */
real gamr_(real *x);
doublereal dgamr_(doublereal *x);
complex cgamr_(complex *x);

/**
 * Log abs gamma.
 *
 * Formula: ln |gamma(x)|
 * Fortran Name: ALNGAM, DLNGAM
 */
real alngam_(real *x);
doublereal dlngam_(doublereal *x);

/**
 * Log gamma.
 *
 * Formula: ln gamma(z)
 * Fortran Name: CLNGAM
 */
complex clngam_(complex *z);

/**
 * Log abs gamma with sign.
 *
 * Formula: g = ln |gamma(x)|, s = sign gamma(x)
 * Fortran Name: ALGAMS, DLGAMS
 */
void algams_(real *x, real *g, real *s);
void dlgams_(doublereal *x, doublereal *g, doublereal *s);

/**
 * Incomplete gamma.
 *
 * Formula: gamma(a,x) = integral from 0 to x of (t**(a-1) * e**-t)dt
 * Fortran Name: GAMI, DGAMI
 */
real gami_(real *a, real *x);
doublereal dgami_(doublereal *a, doublereal *x);

/**
 * Complementary incomplete gamma.
 *
 * Formula: gamma(a,x) = integral from x to infinity of (t**(a-1) * e**-t)dt
 * Fortran Name: GAMIC, DGAMIC
 */
real gamic_(real *a, real *x);
doublereal dgamic_(doublereal *a, doublereal *x);

/**
 * Tricomi's incomplete gamma.
 *
 * Formula: gamma*(a,x) = x**-a * incomplete gamma(a,x) / gamma(a)
 * Fortran Name: GAMIT, DGAMIT
 */
real gamit_(real *a, real *x);
doublereal dgamit_(doublereal *a, doublereal *x);

/**
 * Psi (Digamma).
 *
 * Formula: psi(x) = gamma'(x) / gamma(x)
 * Fortran Name: PSI, DPSI, CPSI
 */
real psi_(real *x);
doublereal dpsi_(doublereal *x);
complex cpsi_(complex *x);

/* Pochhammer's generalized symbol */
/* POCH(A,X) */
real poch_(real *a, real *x);
doublereal dpoch_(doublereal *a, doublereal *x);

/* Pochhammer's symbol from first order */
/* POCH1(A,X) */
real poch1_(real *a, real *x);
doublereal dpoch1_(doublereal *a, doublereal *x);

/* Beta */
/* BETA(A,B) */
real beta_(real *a, real *b);
doublereal dbeta_(doublereal *a, doublereal *b);
complex cbeta_(complex *a, complex *b);

/* Log beta */
/* ALBETA(A,B) */
real albeta_(real *a, real *b);
doublereal dlbeta_(doublereal *a, doublereal *b);
complex clbeta_(complex *a, complex *b);

/* Incomplete beta */
/* BETAI(X,A,B) */
real betai_(real *x, real *a, real *b);
doublereal dbetai_(doublereal *x, doublereal *a, doublereal *b);

/* Log gamma correction term */
/* R9LGMC(X) */
real r9lgmc_(real *x);
doublereal d9lgmc_(doublereal *x);
complex c9lgmc_(complex *x);

/* --- Error Functions and Fresnel Integrals --- */

/**
 * Error function.
 *
 * Formula: erf x = (2 / square root of pi) * the integral from 0 to x of e**(-t**2)dt
 * Fortran Name: ERF, DERF
 */
real erf_(real *x);
doublereal derf_(doublereal *x);

/**
 * Complementary error function.
 *
 * Formula: erfc x = (2 / square root of pi) * the integral from x to infinity of e**(-t**2)dt
 * Fortran Name: ERFC, DERFC
 */
real erfc_(real *x);
doublereal derfc_(doublereal *x);

/**
 * Dawson's function.
 *
 * Formula: F(x) = e**(-x**2) * the integral from 0 to x of e**(t**2)dt
 * Fortran Name: DAWS, DDAWS
 */
real daws_(real *x);
doublereal ddaws_(doublereal *x);

/* --- Bessel Functions --- */

/**
 * Bessel function of the first kind, order zero.
 *
 * Formula: J sub 0 (x)
 * Fortran Name: BESJ0, DBESJ0
 */
real besj0_(real *x);
doublereal dbesj0_(doublereal *x);

/**
 * Bessel function of the first kind, order one.
 *
 * Formula: J sub 1 (x)
 * Fortran Name: BESJ1, DBESJ1
 */
real besj1_(real *x);
doublereal dbesj1_(doublereal *x);

/**
 * Bessel function of the second kind, order zero.
 *
 * Formula: Y sub 0 (x)
 * Fortran Name: BESY0, DBESY0
 */
real besy0_(real *x);
doublereal dbesy0_(doublereal *x);

/**
 * Bessel function of the second kind, order one.
 *
 * Formula: Y sub 1 (x)
 * Fortran Name: BESY1, DBESY1
 */
real besy1_(real *x);
doublereal dbesy1_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order zero.
 *
 * Formula: I sub 0 (x)
 * Fortran Name: BESI0, DBESI0
 */
real besi0_(real *x);
doublereal dbesi0_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order one.
 *
 * Formula: I sub 1 (x)
 * Fortran Name: BESI1, DBESI1
 */
real besi1_(real *x);
doublereal dbesi1_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order zero.
 *
 * Formula: K sub 0 (x)
 * Fortran Name: BESK0, DBESK0
 */
real besk0_(real *x);
doublereal dbesk0_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order one.
 *
 * Formula: K sub 1 (x)
 * Fortran Name: BESK1, DBESK1
 */
real besk1_(real *x);
doublereal dbesk1_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order zero, scaled.
 *
 * Formula: e**-|x| * I sub 0(x)
 * Fortran Name: BESI0E, DBSI0E
 */
real besi0e_(real *x);
doublereal dbsi0e_(doublereal *x);

/**
 * Modified Bessel function of the first kind, order one, scaled.
 *
 * Formula: e**-|x| * I sub 1(x)
 * Fortran Name: BESI1E, DBSI1E
 */
real besi1e_(real *x);
doublereal dbsi1e_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order zero, scaled.
 *
 * Formula: e**x * K sub 0 (x)
 * Fortran Name: BESK0E, DBSK0E
 */
real besk0e_(real *x);
doublereal dbsk0e_(doublereal *x);

/**
 * Modified Bessel function of the third kind, order one, scaled.
 *
 * Formula: e**x * K sub 1 (x)
 * Fortran Name: BESK1E, DBSK1E
 */
real besk1e_(real *x);
doublereal dbsk1e_(doublereal *x);

/* Sequences of Bessel functions */

/**
 * Sequence of modified Bessel functions of the first kind.
 *
 * Formula: I sub v+k-1 (x), k = 1,2,...N. Optional scaling by e**(-x).
 * Fortran Name: BESI, DBESI
 */
void besi_(real *x, real *alpha, integer *kode, integer *n, real *y, integer *nz);
void dbesi_(doublereal *x, doublereal *alpha, integer *kode, integer *n, doublereal *y, integer *nz);

/**
 * Sequence of Bessel functions of the first kind.
 *
 * Formula: J sub v+k-1 (x), k = 1,2,...N
 * Fortran Name: BESJ, DBESJ
 */
void besj_(real *x, real *alpha, integer *n, real *y, integer *nz);
void dbesj_(doublereal *x, doublereal *alpha, integer *n, doublereal *y, integer *nz);

/**
 * Sequence of Bessel functions of the second kind.
 *
 * Formula: Y sub v+k-1 (x), k = 1,2,...N
 * Fortran Name: BESY, DBESY
 */
void besy_(real *x, real *fnu, integer *n, real *y);
void dbesy_(doublereal *x, doublereal *fnu, integer *n, doublereal *y);

/**
 * Sequence of modified Bessel functions of the third kind.
 *
 * Formula: K sub v+k-1 (x), k = 1,2,...N. Optional scaling by e**(x).
 * Fortran Name: BESK, DBESK
 */
void besk_(real *x, real *fnu, integer *kode, integer *n, real *y, integer *nz);
void dbesk_(doublereal *x, doublereal *fnu, integer *kode, integer *n, doublereal *y, integer *nz);

/**
 * Sequence of modified Bessel functions of the third kind.
 *
 * Formula: K sub v+i (x), I = 0, 1, ..., N-1 for N > 0 or I = 0, -1, ..., N+1 for N < 0.
 * Fortran Name: BESKS, DBESKS
 */
void besks_(real *xnu, real *x, integer *n, real *bk);
void dbesks_(doublereal *xnu, doublereal *x, integer *n, doublereal *bk);

/**
 * Sequence of modified Bessel functions of the third kind, scaled.
 *
 * Formula: e**x * K sub v+i (x), I = 0, 1, ..., N-1 for N > 0 or I = 0, -1, ..., N+1 for N < 0.
 * Fortran Name: BESKES, DBSKES
 */
void beskes_(real *xnu, real *x, integer *n, real *bk);
void dbskes_(doublereal *xnu, doublereal *x, integer *n, doublereal *bk);

/* --- Bessel Functions of Fractional Order --- */

/**
 * Airy function Ai.
 *
 * Formula: Ai(x)
 * Fortran Name: AI, DAI
 */
real ai_(real *x);
doublereal dai_(doublereal *x);

/**
 * Airy function Bi.
 *
 * Formula: Bi(x)
 * Fortran Name: BI, DBI
 */
real bi_(real *x);
doublereal dbi_(doublereal *x);

/**
 * Exponentially scaled Airy function Ai.
 *
 * Formula: Ai(x), x <= 0; exp(2/3 * x**(3/2)) * Ai(x), x >= 0
 * Fortran Name: AIE, DAIE
 */
real aie_(real *x);
doublereal daie_(doublereal *x);

/**
 * Exponentially scaled Airy function Bi.
 *
 * Formula: Bi(x), x <= 0; exp(-2/3 * x**(3/2)) * Bi(x), x >= 0
 * Fortran Name: BIE, DBIE
 */
real bie_(real *x);
doublereal dbie_(doublereal *x);

/* --- Confluent Hypergeometric Functions --- */

/**
 * Confluent hypergeometric function.
 *
 * Formula: U(a,b,x)
 * Fortran Name: CHU, DCHU
 */
real chu_(real *a, real *b, real *x);
doublereal dchu_(doublereal *a, doublereal *b, doublereal *x);

/* --- Miscellaneous Functions --- */

/**
 * Spence dilogarithm.
 *
 * Formula: s(x) = - the integral from 0 to x of ((ln |1-y|) / y)dy
 * Fortran Name: SPENC, DSPENC
 */
real spenc_(real *x);
doublereal dspenc_(doublereal *x);

#ifdef __cplusplus
}
#endif

#endif /* FNLIB_H */