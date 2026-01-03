# C. Elementary and special functions

> (search also class L5)

```@meta
CurrentModule = SLATEC
```

- [`FNLIB`](@ref): `FUNDOC-A`,
    Documentation for FNLIB, a collection of routines for
    evaluating elementary and special functions.


## C1. Integer-valued functions

> (e.g., floor, ceiling, factorial, binomial coefficient)

          BINOM-S   Compute the binomial coefficients.
          DBINOM-D

          FAC-S     Compute the factorial function.
          DFAC-D

          POCH-S    Evaluate a generalization of Pochhammer's symbol.
          DPOCH-D

          POCH1-S   Calculate a generalization of Pochhammer's symbol starting
          DPOCH1-D  from first order.

## C2. Powers, roots, reciprocals

          CBRT-S    Compute the cube root.
          DCBRT-D
          CCBRT-C

## C3. Polynomials
C3A.  Orthogonal
C3A2.  Chebyshev, Legendre

          CSEVL-S   Evaluate a Chebyshev series.
          DCSEVL-D

          INITS-S   Determine the number of terms needed in an orthogonal
          INITDS-D  polynomial series so that it meets a specified accuracy.

          QMOMO-S   This routine computes modified Chebyshev moments.  The K-th
          DQMOMO-D  modified Chebyshev moment is defined as the integral over
                    (-1,1) of W(X)*T(K,X), where T(K,X) is the Chebyshev
                    polynomial of degree K.

          XLEGF-S   Compute normalized Legendre polynomials and associated
          DXLEGF-D  Legendre functions.

          XNRMP-S   Compute normalized Legendre polynomials.
          DXNRMP-D

## C4. Elementary transcendental functions
C4A.  Trigonometric, inverse trigonometric

          CACOS-C   Compute the complex arc cosine.

          CASIN-C   Compute the complex arc sine.

          CATAN-C   Compute the complex arc tangent.

          CATAN2-C  Compute the complex arc tangent in the proper quadrant.

          COSDG-S   Compute the cosine of an argument in degrees.
          DCOSDG-D

          COT-S     Compute the cotangent.
          DCOT-D
          CCOT-C

          CTAN-C    Compute the complex tangent.

          SINDG-S   Compute the sine of an argument in degrees.
          DSINDG-D

C4B.  Exponential, logarithmic

          ALNREL-S  Evaluate ln(1+X) accurate in the sense of relative error.
          DLNREL-D
          CLNREL-C

          CLOG10-C  Compute the principal value of the complex base 10
                    logarithm.

          EXPREL-S  Calculate the relative error exponential (EXP(X)-1)/X.
          DEXPRL-D
          CEXPRL-C

C4C.  Hyperbolic, inverse hyperbolic

          ACOSH-S   Compute the arc hyperbolic cosine.
          DACOSH-D
          CACOSH-C

          ASINH-S   Compute the arc hyperbolic sine.
          DASINH-D
          CASINH-C

          ATANH-S   Compute the arc hyperbolic tangent.
          DATANH-D
          CATANH-C

          CCOSH-C   Compute the complex hyperbolic cosine.

          CSINH-C   Compute the complex hyperbolic sine.

          CTANH-C   Compute the complex hyperbolic tangent.

## C5. Exponential and logarithmic integrals

- [`ali(x)`](@ref FNLIB.ali): `ALI-S, DLI-D`,
    Compute the logarithmic integral.
- [`e1(x)`](@ref FNLIB.e1): `E1-S, DE1-D`,
    Compute the exponential integral `E1(X)`.
- [`ei(x)`](@ref FNLIB.ei): `EI-S, DEI-D`,
    Compute the exponential integral `Ei(X)`.
- [`exint(x,n,kode,m,tol)`](@ref FNLIB.exint): `EXINT-S, DEXINT-D`,
    Compute an M member sequence of exponential integrals.
   `E(N+K,X)`, `K=0,1,...,M-1 for N .GE. 1` and `X .GE. 0`.
- [`spenc(x)`](@ref FNLIB.spenc): `SPENC-S, DSPENC-D`,
    Compute a form of Spence's integral due to K. Mitchell.

## C7. Gamma
C7A.  Gamma, log gamma, reciprocal gamma

          ALGAMS-S  Compute the logarithm of the absolute value of the Gamma
          DLGAMS-D  function.

          ALNGAM-S  Compute the logarithm of the absolute value of the Gamma
          DLNGAM-D  function.
          CLNGAM-C

          C0LGMC-C  Evaluate (Z+0.5)*LOG((Z+1.)/Z) - 1.0 with relative
                    accuracy.

          GAMLIM-S  Compute the minimum and maximum bounds for the argument in
          DGAMLM-D  the Gamma function.

          GAMMA-S   Compute the complete Gamma function.
          DGAMMA-D
          CGAMMA-C

          GAMR-S    Compute the reciprocal of the Gamma function.
          DGAMR-D
          CGAMR-C

          POCH-S    Evaluate a generalization of Pochhammer's symbol.
          DPOCH-D

          POCH1-S   Calculate a generalization of Pochhammer's symbol starting
          DPOCH1-D  from first order.

C7B.  Beta, log beta

          ALBETA-S  Compute the natural logarithm of the complete Beta
          DLBETA-D  function.
          CLBETA-C

          BETA-S    Compute the complete Beta function.
          DBETA-D
          CBETA-C

C7C.  Psi function

          PSI-S     Compute the Psi (or Digamma) function.
          DPSI-D
          CPSI-C

          PSIFN-S   Compute derivatives of the Psi function.
          DPSIFN-D

C7E.  Incomplete gamma

          GAMI-S    Evaluate the incomplete Gamma function.
          DGAMI-D

          GAMIC-S   Calculate the complementary incomplete Gamma function.
          DGAMIC-D

          GAMIT-S   Calculate Tricomi's form of the incomplete Gamma function.
          DGAMIT-D

C7F.  Incomplete beta

          BETAI-S   Calculate the incomplete Beta function.
          DBETAI-D

## C8. Error functions
C8A.  Error functions, their inverses, integrals, including the normal
      distribution function

          ERF-S     Compute the error function.
          DERF-D

          ERFC-S    Compute the complementary error function.
          DERFC-D

C8C.  Dawson's integral

          DAWS-S    Compute Dawson's function.
          DDAWS-D

## C9. Legendre functions

          XLEGF-S   Compute normalized Legendre polynomials and associated
          DXLEGF-D  Legendre functions.

          XNRMP-S   Compute normalized Legendre polynomials.
          DXNRMP-D

## C10.  Bessel functions
C10A.  J, Y, H-(1), H-(2)
C10A1.  Real argument, integer order

          BESJ0-S   Compute the Bessel function of the first kind of order
          DBESJ0-D  zero.

          BESJ1-S   Compute the Bessel function of the first kind of order one.
          DBESJ1-D

          BESY0-S   Compute the Bessel function of the second kind of order
          DBESY0-D  zero.

          BESY1-S   Compute the Bessel function of the second kind of order
          DBESY1-D  one.

C10A3.  Real argument, real order

          BESJ-S    Compute an N member sequence of J Bessel functions
          DBESJ-D   J/SUB(ALPHA+K-1)/(X), K=1,...,N for non-negative ALPHA
                    and X.

          BESY-S    Implement forward recursion on the three term recursion
          DBESY-D   relation for a sequence of non-negative order Bessel
                    functions Y/SUB(FNU+I-1)/(X), I=1,...,N for real, positive
                    X and non-negative orders FNU.

C10A4.  Complex argument, real order

          CBESH-C   Compute a sequence of the Hankel functions H(m,a,z)
          ZBESH-C   for superscript m=1 or 2, real nonnegative orders a=b,
                    b+1,... where b>0, and nonzero complex argument z.  A
                    scaling option is available to help avoid overflow.

          CBESJ-C   Compute a sequence of the Bessel functions J(a,z) for
          ZBESJ-C   complex argument z and real nonnegative orders a=b,b+1,
                    b+2,... where b>0.  A scaling option is available to
                    help avoid overflow.

          CBESY-C   Compute a sequence of the Bessel functions Y(a,z) for
          ZBESY-C   complex argument z and real nonnegative orders a=b,b+1,
                    b+2,... where b>0.  A scaling option is available to
                    help avoid overflow.

C10B.  I, K
C10B1.  Real argument, integer order

          BESI0-S   Compute the hyperbolic Bessel function of the first kind
          DBESI0-D  of order zero.

          BESI0E-S  Compute the exponentially scaled modified (hyperbolic)
          DBSI0E-D  Bessel function of the first kind of order zero.

          BESI1-S   Compute the modified (hyperbolic) Bessel function of the
          DBESI1-D  first kind of order one.

          BESI1E-S  Compute the exponentially scaled modified (hyperbolic)
          DBSI1E-D  Bessel function of the first kind of order one.

          BESK0-S   Compute the modified (hyperbolic) Bessel function of the
          DBESK0-D  third kind of order zero.

          BESK0E-S  Compute the exponentially scaled modified (hyperbolic)
          DBSK0E-D  Bessel function of the third kind of order zero.

          BESK1-S   Compute the modified (hyperbolic) Bessel function of the
          DBESK1-D  third kind of order one.

          BESK1E-S  Compute the exponentially scaled modified (hyperbolic)
          DBSK1E-D  Bessel function of the third kind of order one.

C10B3.  Real argument, real order

          BESI-S    Compute an N member sequence of I Bessel functions
          DBESI-D   I/SUB(ALPHA+K-1)/(X), K=1,...,N or scaled Bessel functions
                    EXP(-X)*I/SUB(ALPHA+K-1)/(X), K=1,...,N for non-negative
                    ALPHA and X.

          BESK-S    Implement forward recursion on the three term recursion
          DBESK-D   relation for a sequence of non-negative order Bessel
                    functions K/SUB(FNU+I-1)/(X), or scaled Bessel functions
                    EXP(X)*K/SUB(FNU+I-1)/(X), I=1,...,N for real, positive
                    X and non-negative orders FNU.

          BESKES-S  Compute a sequence of exponentially scaled modified Bessel
          DBSKES-D  functions of the third kind of fractional order.

          BESKS-S   Compute a sequence of modified Bessel functions of the
          DBESKS-D  third kind of fractional order.

C10B4.  Complex argument, real order

          CBESI-C   Compute a sequence of the Bessel functions I(a,z) for
          ZBESI-C   complex argument z and real nonnegative orders a=b,b+1,
                    b+2,... where b>0.  A scaling option is available to
                    help avoid overflow.

          CBESK-C   Compute a sequence of the Bessel functions K(a,z) for
          ZBESK-C   complex argument z and real nonnegative orders a=b,b+1,
                    b+2,... where b>0.  A scaling option is available to
                    help avoid overflow.

C10D.  Airy and Scorer functions

          AI-S      Evaluate the Airy function.
          DAI-D

          AIE-S     Calculate the Airy function for a negative argument and an
          DAIE-D    exponentially scaled Airy function for a non-negative
                    argument.

          BI-S      Evaluate the Bairy function (the Airy function of the
          DBI-D     second kind).

          BIE-S     Calculate the Bairy function for a negative argument and an
          DBIE-D    exponentially scaled Bairy function for a non-negative
                    argument.

          CAIRY-C   Compute the Airy function Ai(z) or its derivative dAi/dz
          ZAIRY-C   for complex argument z.  A scaling option is available
                    to help avoid underflow and overflow.

          CBIRY-C   Compute the Airy function Bi(z) or its derivative dBi/dz
          ZBIRY-C   for complex argument z.  A scaling option is available
                    to help avoid overflow.

C10F.  Integrals of Bessel functions

          BSKIN-S   Compute repeated integrals of the K-zero Bessel function.
          DBSKIN-D

## C11.  Confluent hypergeometric functions

- [`chu(x)`](@ref FNLIB.chu): `CHU-S, DCHU-D`,
    Compute the logarithmic confluent hypergeometric function.

## C14.  Elliptic integrals

          RC-S      Calculate an approximation to
          DRC-D      RC(X,Y) = Integral from zero to infinity of
                                      -1/2     -1
                            (1/2)(t+X)    (t+Y)  dt,
                    where X is nonnegative and Y is positive.

          RD-S      Compute the incomplete or complete elliptic integral of the
          DRD-D     2nd kind.  For X and Y nonnegative, X+Y and Z positive,
                     RD(X,Y,Z) = Integral from zero to infinity of
                                        -1/2     -1/2     -3/2
                              (3/2)(t+X)    (t+Y)    (t+Z)    dt.
                    If X or Y is zero, the integral is complete.

          RF-S      Compute the incomplete or complete elliptic integral of the
          DRF-D     1st kind.  For X, Y, and Z non-negative and at most one of
                    them zero, RF(X,Y,Z) = Integral from zero to infinity of
                                        -1/2     -1/2     -1/2
                              (1/2)(t+X)    (t+Y)    (t+Z)    dt.
                    If X, Y or Z is zero, the integral is complete.

          RJ-S      Compute the incomplete or complete (X or Y or Z is zero)
          DRJ-D     elliptic integral of the 3rd kind.  For X, Y, and Z non-
                    negative, at most one of them zero, and P positive,
                     RJ(X,Y,Z,P) = Integral from zero to infinity of
                                          -1/2     -1/2     -1/2     -1
                                (3/2)(t+X)    (t+Y)    (t+Z)    (t+P)  dt.

## C19.  Other special functions

          RC3JJ-S   Evaluate the 3j symbol f(L1) = (  L1   L2 L3)
          DRC3JJ-D                                 (-M2-M3 M2 M3)
                    for all allowed values of L1, the other parameters
                    being held fixed.

          RC3JM-S   Evaluate the 3j symbol g(M2) = (L1 L2   L3  )
          DRC3JM-D                                 (M1 M2 -M1-M2)
                    for all allowed values of M2, the other parameters
                    being held fixed.

          RC6J-S    Evaluate the 6j symbol h(L1) = {L1 L2 L3}
          DRC6J-D                                  {L4 L5 L6}
                    for all allowed values of L1, the other parameters
                    being held fixed.

