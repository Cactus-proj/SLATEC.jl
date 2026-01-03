# TOC All

```@meta
CurrentModule = SLATEC
```

> SLATEC Common Mathematical Library, Table of Contents

This table of contents of the SLATEC Common Mathematical Library (CML)
contains the names and purposes of all user-callable CML routines,
arranged by GAMS category.

The current library has routines in the following GAMS major categories:

    A.  Arithmetic, error analysis
    C.  Elementary and special functions (search also class L5)
    D.  Linear Algebra
    E.  Interpolation
    F.  Solution of nonlinear equations
    G.  Optimization (search also classes K, L8)
    H.  Differentiation, integration
    I.  Differential and integral equations
    J.  Integral transforms
    K.  Approximation (search also class L8)
    L.  Statistics, probability
    N.  Data handling (search also class L2)
    R.  Service routines
    Z.  Other

The library contains routines which operate on different types of data but
which are otherwise equivalent.  The names of equivalent routines are listed
vertically before the purpose.  Immediately after each name is a hyphen (-)
and one of the alphabetic characters S, D, C, I, H, L, or A, where
S indicates a single precision routine, D double precision, C complex,
I integer, H character, L logical, and A is a pseudo-type given to routines
that could not reasonably be converted to some other type.

!!! info "Exported functions name"

    When exporting from this library, the single-precision routine names are used;
    implementations of other precisions are forwarded to the same name
    but with different argument types.

## Page TOC

```@contents
Pages = ["index.md"]
Depth = 3
```


## A. Arithmetic, error analysis

### A3. Real

A3D.  Extended range

          XADD-S    To provide single-precision floating-point arithmetic
          DXADD-D   with an extended exponent range.

          XADJ-S    To provide single-precision floating-point arithmetic
          DXADJ-D   with an extended exponent range.

          XC210-S   To provide single-precision floating-point arithmetic
          DXC210-D  with an extended exponent range.

          XCON-S    To provide single-precision floating-point arithmetic
          DXCON-D   with an extended exponent range.

          XRED-S    To provide single-precision floating-point arithmetic
          DXRED-D   with an extended exponent range.

          XSET-S    To provide single-precision floating-point arithmetic
          DXSET-D   with an extended exponent range.

### A4. Complex
A4A.  Single precision

          CARG-C    Compute the argument of a complex number.

### A6. Change of representation
A6B.  Base conversion

          R9PAK-S   Pack a base 2 exponent into a floating point number.
          D9PAK-D

          R9UPAK-S  Unpack a floating point number X so that X = Y*2**N.
          D9UPAK-D

## C - GAMS Class C

[C. Elementary and special functions](gams-c.md)

## D - GAMS Class D

[D. Linear Algebra](gams-d.md)

## E. Interpolation

          BSPDOC-A  Documentation for BSPLINE, a package of subprograms for
                    working with piecewise polynomial functions
                    in B-representation.

### E1. Univariate data (curve fitting)
E1A.  Polynomial splines (piecewise polynomials)

          BINT4-S   Compute the B-representation of a cubic spline
          DBINT4-D  which interpolates given data.

          BINTK-S   Compute the B-representation of a spline which interpolates
          DBINTK-D  given data.

          BSPDOC-A  Documentation for BSPLINE, a package of subprograms for
                    working with piecewise polynomial functions
                    in B-representation.

          PCHDOC-A  Documentation for PCHIP, a Fortran package for piecewise
                    cubic Hermite interpolation of data.

          PCHIC-S   Set derivatives needed to determine a piecewise monotone
          DPCHIC-D  piecewise cubic Hermite interpolant to given data.
                    User control is available over boundary conditions and/or
                    treatment of points where monotonicity switches direction.

          PCHIM-S   Set derivatives needed to determine a monotone piecewise
          DPCHIM-D  cubic Hermite interpolant to given data.  Boundary values
                    are provided which are compatible with monotonicity.  The
                    interpolant will have an extremum at each point where mono-
                    tonicity switches direction.  (See PCHIC if user control is
                    desired over boundary or switch conditions.)

          PCHSP-S   Set derivatives needed to determine the Hermite represen-
          DPCHSP-D  tation of the cubic spline interpolant to given data, with
                    specified boundary conditions.

E1B.  Polynomials

          POLCOF-S  Compute the coefficients of the polynomial fit (including
          DPOLCF-D  Hermite polynomial fits) produced by a previous call to
                    POLINT.

          POLINT-S  Produce the polynomial which interpolates a set of discrete
          DPLINT-D  data points.

### E3. Service routines
> (e.g., grid generation, evaluation of fitted functions)
> (search also class N5)

          BFQAD-S   Compute the integral of a product of a function and a
          DBFQAD-D  derivative of a B-spline.

          BSPDR-S   Use the B-representation to construct a divided difference
          DBSPDR-D  table preparatory to a (right) derivative calculation.

          BSPEV-S   Calculate the value of the spline and its derivatives from
          DBSPEV-D  the B-representation.

          BSPPP-S   Convert the B-representation of a B-spline to the piecewise
          DBSPPP-D  polynomial (PP) form.

          BSPVD-S   Calculate the value and all derivatives of order less than
          DBSPVD-D  NDERIV of all basis functions which do not vanish at X.

          BSPVN-S   Calculate the value of all (possibly) nonzero basis
          DBSPVN-D  functions at X.

          BSQAD-S   Compute the integral of a K-th order B-spline using the
          DBSQAD-D  B-representation.

          BVALU-S   Evaluate the B-representation of a B-spline at X for the
          DBVALU-D  function value or any of its derivatives.

          CHFDV-S   Evaluate a cubic polynomial given in Hermite form and its
          DCHFDV-D  first derivative at an array of points.  While designed for
                    use by PCHFD, it may be useful directly as an evaluator
                    for a piecewise cubic Hermite function in applications,
                    such as graphing, where the interval is known in advance.
                    If only function values are required, use CHFEV instead.

          CHFEV-S   Evaluate a cubic polynomial given in Hermite form at an
          DCHFEV-D  array of points.  While designed for use by PCHFE, it may
                    be useful directly as an evaluator for a piecewise cubic
                    Hermite function in applications, such as graphing, where
                    the interval is known in advance.

          INTRV-S   Compute the largest integer ILEFT in 1 .LE. ILEFT .LE. LXT
          DINTRV-D  such that XT(ILEFT) .LE. X where XT(*) is a subdivision
                    of the X interval.

          PCHBS-S   Piecewise Cubic Hermite to B-Spline converter.
          DPCHBS-D

          PCHCM-S   Check a cubic Hermite function for monotonicity.
          DPCHCM-D

          PCHFD-S   Evaluate a piecewise cubic Hermite function and its first
          DPCHFD-D  derivative at an array of points.  May be used by itself
                    for Hermite interpolation, or as an evaluator for PCHIM
                    or PCHIC.  If only function values are required, use
                    PCHFE instead.

          PCHFE-S   Evaluate a piecewise cubic Hermite function at an array of
          DPCHFE-D  points.  May be used by itself for Hermite interpolation,
                    or as an evaluator for PCHIM or PCHIC.

          PCHIA-S   Evaluate the definite integral of a piecewise cubic
          DPCHIA-D  Hermite function over an arbitrary interval.

          PCHID-S   Evaluate the definite integral of a piecewise cubic
          DPCHID-D  Hermite function over an interval whose endpoints are data
                    points.

          PFQAD-S   Compute the integral on (X1,X2) of a product of a function
          DPFQAD-D  F and the ID-th derivative of a B-spline,
                    (PP-representation).

          POLYVL-S  Calculate the value of a polynomial and its first NDER
          DPOLVL-D  derivatives where the polynomial was produced by a previous
                    call to POLINT.

          PPQAD-S   Compute the integral on (X1,X2) of a K-th order B-spline
          DPPQAD-D  using the piecewise polynomial (PP) representation.

          PPVAL-S   Calculate the value of the IDERIV-th derivative of the
          DPPVAL-D  B-spline from the PP-representation.


## F. Solution of nonlinear equations

### F1. Single equation

F1A.  Smooth
F1A1.  Polynomial
F1A1A.  Real coefficients

          RPQR79-S  Find the zeros of a polynomial with real coefficients.
          CPQR79-C

          RPZERO-S  Find the zeros of a polynomial with real coefficients.
          CPZERO-C

F1A1B.  Complex coefficients

          CPQR79-C  Find the zeros of a polynomial with complex coefficients.
          RPQR79-S

          CPZERO-C  Find the zeros of a polynomial with complex coefficients.
          RPZERO-S

F1B.  General (no smoothness assumed)

          FZERO-S   Search for a zero of a function F(X) in a given interval
          DFZERO-D  (B,C).  It is designed primarily for problems where F(B)
                    and F(C) have opposite signs.

### F2. System of equations
F2A.  Smooth

          SNSQ-S    Find a zero of a system of a N nonlinear functions in N
          DNSQ-D    variables by a modification of the Powell hybrid method.

          SNSQE-S   An easy-to-use code to find a zero of a system of N
          DNSQE-D   nonlinear functions in N variables by a modification of
                    the Powell hybrid method.

          SOS-S     Solve a square system of nonlinear equations.
          DSOS-D

### F3. Service routines
(e.g., check user-supplied derivatives)

          CHKDER-S  Check the gradients of M nonlinear functions in N
          DCKDER-D  variables, evaluated at a point X, for consistency
                    with the functions themselves.


## G. Optimization
> (search also classes K, L8)

### G2. Constrained

G2A.  Linear programming
G2A2.  Sparse matrix of constraints

          SPLP-S    Solve linear programming problems involving at
          DSPLP-D   most a few thousand constraints and variables.
                    Takes advantage of sparsity in the constraint matrix.

G2E.  Quadratic programming

          SBOCLS-S  Solve the bounded and constrained least squares
          DBOCLS-D  problem consisting of solving the equation
                              E*X = F  (in the least squares sense)
                     subject to the linear constraints
                                    C*X = Y.

          SBOLS-S   Solve the problem
          DBOLS-D        E*X = F (in the least  squares  sense)
                    with bounds on selected X values.

G2H.  General nonlinear programming
G2H1.  Simple bounds

          SBOCLS-S  Solve the bounded and constrained least squares
          DBOCLS-D  problem consisting of solving the equation
                              E*X = F  (in the least squares sense)
                     subject to the linear constraints
                                    C*X = Y.

          SBOLS-S   Solve the problem
          DBOLS-D        E*X = F (in the least  squares  sense)
                    with bounds on selected X values.

G2H2.  Linear equality or inequality constraints

          SBOCLS-S  Solve the bounded and constrained least squares
          DBOCLS-D  problem consisting of solving the equation
                              E*X = F  (in the least squares sense)
                     subject to the linear constraints
                                    C*X = Y.

          SBOLS-S   Solve the problem
          DBOLS-D        E*X = F (in the least  squares  sense)
                    with bounds on selected X values.

### G4. Service routines
G4C.  Check user-supplied derivatives

          CHKDER-S  Check the gradients of M nonlinear functions in N
          DCKDER-D  variables, evaluated at a point X, for consistency
                    with the functions themselves.


## H. Differentiation, integration

### H1. Numerical differentiation

          CHFDV-S   Evaluate a cubic polynomial given in Hermite form and its
          DCHFDV-D  first derivative at an array of points.  While designed for
                    use by PCHFD, it may be useful directly as an evaluator
                    for a piecewise cubic Hermite function in applications,
                    such as graphing, where the interval is known in advance.
                    If only function values are required, use CHFEV instead.

          PCHFD-S   Evaluate a piecewise cubic Hermite function and its first
          DPCHFD-D  derivative at an array of points.  May be used by itself
                    for Hermite interpolation, or as an evaluator for PCHIM
                    or PCHIC.  If only function values are required, use
                    PCHFE instead.

### H2. Quadrature (numerical evaluation of definite integrals)

          QPDOC-A   Documentation for QUADPACK, a package of subprograms for
                    automatic evaluation of one-dimensional definite integrals.

H2A.  One-dimensional integrals
H2A1.  Finite interval (general integrand)
H2A1A.  Integrand available via user-defined procedure
H2A1A1.  Automatic (user need only specify required accuracy)

          GAUS8-S   Integrate a real function of one variable over a finite
          DGAUS8-D  interval using an adaptive 8-point Legendre-Gauss
                    algorithm.  Intended primarily for high accuracy
                    integration or integration of smooth functions.

          QAG-S     The routine calculates an approximation result to a given
          DQAG-D    definite integral I = integral of F over (A,B),
                    hopefully satisfying following claim for accuracy
                    ABS(I-RESULT)LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAGE-S    The routine calculates an approximation result to a given
          DQAGE-D   definite integral   I = Integral of F over (A,B),
                    hopefully satisfying following claim for accuracy
                    ABS(I-RESLT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAGS-S    The routine calculates an approximation result to a given
          DQAGS-D   Definite integral  I = Integral of F over (A,B),
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAGSE-S   The routine calculates an approximation result to a given
          DQAGSE-D  definite integral I = Integral of F over (A,B),
                    hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QNC79-S   Integrate a function using a 7-point adaptive Newton-Cotes
          DQNC79-D  quadrature rule.

          QNG-S     The routine calculates an approximation result to a
          DQNG-D    given definite integral I = integral of F over (A,B),
                    hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

H2A1A2.  Nonautomatic

          QK15-S    To compute I = Integral of F over (A,B), with error
          DQK15-D                  estimate
                               J = integral of ABS(F) over (A,B)

          QK21-S    To compute I = Integral of F over (A,B), with error
          DQK21-D                  estimate
                               J = Integral of ABS(F) over (A,B)

          QK31-S    To compute I = Integral of F over (A,B) with error
          DQK31-D                  estimate
                               J = Integral of ABS(F) over (A,B)

          QK41-S    To compute I = Integral of F over (A,B), with error
          DQK41-D                  estimate
                               J = Integral of ABS(F) over (A,B)

          QK51-S    To compute I = Integral of F over (A,B) with error
          DQK51-D                  estimate
                               J = Integral of ABS(F) over (A,B)

          QK61-S    To compute I = Integral of F over (A,B) with error
          DQK61-D                  estimate
                               J = Integral of ABS(F) over (A,B)

H2A1B.  Integrand available only on grid
H2A1B2.  Nonautomatic

          AVINT-S   Integrate a function tabulated at arbitrarily spaced
          DAVINT-D  abscissas using overlapping parabolas.

          PCHIA-S   Evaluate the definite integral of a piecewise cubic
          DPCHIA-D  Hermite function over an arbitrary interval.

          PCHID-S   Evaluate the definite integral of a piecewise cubic
          DPCHID-D  Hermite function over an interval whose endpoints are data
                    points.

H2A2.  Finite interval (specific or special type integrand including weight
       functions, oscillating and singular integrands, principal value
       integrals, splines, etc.)
H2A2A.  Integrand available via user-defined procedure
H2A2A1.  Automatic (user need only specify required accuracy)

          BFQAD-S   Compute the integral of a product of a function and a
          DBFQAD-D  derivative of a B-spline.

          BSQAD-S   Compute the integral of a K-th order B-spline using the
          DBSQAD-D  B-representation.

          PFQAD-S   Compute the integral on (X1,X2) of a product of a function
          DPFQAD-D  F and the ID-th derivative of a B-spline,
                    (PP-representation).

          PPQAD-S   Compute the integral on (X1,X2) of a K-th order B-spline
          DPPQAD-D  using the piecewise polynomial (PP) representation.

          QAGP-S    The routine calculates an approximation result to a given
          DQAGP-D   definite integral I = Integral of F over (A,B),
                    hopefully satisfying following claim for accuracy
                    break points of the integration interval, where local
                    difficulties of the integrand may occur(e.g. SINGULARITIES,
                    DISCONTINUITIES), are provided by the user.

          QAGPE-S   Approximate a given definite integral I = Integral of F
          DQAGPE-D  over (A,B), hopefully satisfying the accuracy claim:
                          ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).
                    Break points of the integration interval, where local
                    difficulties of the integrand may occur (e.g. singularities
                    or discontinuities) are provided by the user.

          QAWC-S    The routine calculates an approximation result to a
          DQAWC-D   Cauchy principal value I = INTEGRAL of F*W over (A,B)
                    (W(X) = 1/((X-C), C.NE.A, C.NE.B), hopefully satisfying
                    following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABE,EPSREL*ABS(I)).

          QAWCE-S   The routine calculates an approximation result to a
          DQAWCE-D  CAUCHY PRINCIPAL VALUE I = Integral of F*W over (A,B)
                    (W(X) = 1/(X-C), (C.NE.A, C.NE.B), hopefully satisfying
                    following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I))

          QAWO-S    Calculate an approximation to a given definite integral
          DQAWO-D    I = Integral of F(X)*W(X) over (A,B), where
                           W(X) = COS(OMEGA*X)
                        or W(X) = SIN(OMEGA*X),
                    hopefully satisfying the following claim for accuracy
                        ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAWOE-S   Calculate an approximation to a given definite integral
          DQAWOE-D     I = Integral of F(X)*W(X) over (A,B), where
                          W(X) = COS(OMEGA*X)
                       or W(X) = SIN(OMEGA*X),
                    hopefully satisfying the following claim for accuracy
                       ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAWS-S    The routine calculates an approximation result to a given
          DQAWS-D   definite integral I = Integral of F*W over (A,B),
                    (where W shows a singular behaviour at the end points
                    see parameter INTEGR).
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAWSE-S   The routine calculates an approximation result to a given
          DQAWSE-D  definite integral I = Integral of F*W over (A,B),
                    (where W shows a singular behaviour at the end points,
                    see parameter INTEGR).
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QMOMO-S   This routine computes modified Chebyshev moments.  The K-th
          DQMOMO-D  modified Chebyshev moment is defined as the integral over
                    (-1,1) of W(X)*T(K,X), where T(K,X) is the Chebyshev
                    polynomial of degree K.

H2A2A2.  Nonautomatic

          QC25C-S   To compute I = Integral of F*W over (A,B) with
          DQC25C-D  error estimate, where W(X) = 1/(X-C)

          QC25F-S   To compute the integral I=Integral of F(X) over (A,B)
          DQC25F-D  Where W(X) = COS(OMEGA*X) Or (WX)=SIN(OMEGA*X)
                    and to compute J=Integral of ABS(F) over (A,B). For small
                    value of OMEGA or small intervals (A,B) 15-point GAUSS-
                    KRONROD Rule used. Otherwise generalized CLENSHAW-CURTIS us

          QC25S-S   To compute I = Integral of F*W over (BL,BR), with error
          DQC25S-D  estimate, where the weight function W has a singular
                    behaviour of ALGEBRAICO-LOGARITHMIC type at the points
                    A and/or B. (BL,BR) is a part of (A,B).

          QK15W-S   To compute I = Integral of F*W over (A,B), with error
          DQK15W-D                 estimate
                               J = Integral of ABS(F*W) over (A,B)

H2A3.  Semi-infinite interval (including e**(-x) weight function)
H2A3A.  Integrand available via user-defined procedure
H2A3A1.  Automatic (user need only specify required accuracy)

          QAGI-S    The routine calculates an approximation result to a given
          DQAGI-D   INTEGRAL   I = Integral of F over (BOUND,+INFINITY)
                            OR I = Integral of F over (-INFINITY,BOUND)
                            OR I = Integral of F over (-INFINITY,+INFINITY)
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAGIE-S   The routine calculates an approximation result to a given
          DQAGIE-D  integral   I = Integral of F over (BOUND,+INFINITY)
                            or I = Integral of F over (-INFINITY,BOUND)
                            or I = Integral of F over (-INFINITY,+INFINITY),
                            hopefully satisfying following claim for accuracy
                            ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I))

          QAWF-S    The routine calculates an approximation result to a given
          DQAWF-D   Fourier integral
                    I = Integral of F(X)*W(X) over (A,INFINITY)
                    where W(X) = COS(OMEGA*X) or W(X) = SIN(OMEGA*X).
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.EPSABS.

          QAWFE-S   The routine calculates an approximation result to a
          DQAWFE-D  given Fourier integral
                    I = Integral of F(X)*W(X) over (A,INFINITY)
                     where W(X) = COS(OMEGA*X) or W(X) = SIN(OMEGA*X),
                    hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.EPSABS.

H2A3A2.  Nonautomatic

          QK15I-S   The original (infinite integration range is mapped
          DQK15I-D  onto the interval (0,1) and (A,B) is a part of (0,1).
                    it is the purpose to compute
                    I = Integral of transformed integrand over (A,B),
                    J = Integral of ABS(Transformed Integrand) over (A,B).

H2A4.  Infinite interval (including e**(-x**2)) weight function)
H2A4A.  Integrand available via user-defined procedure
H2A4A1.  Automatic (user need only specify required accuracy)

          QAGI-S    The routine calculates an approximation result to a given
          DQAGI-D   INTEGRAL   I = Integral of F over (BOUND,+INFINITY)
                            OR I = Integral of F over (-INFINITY,BOUND)
                            OR I = Integral of F over (-INFINITY,+INFINITY)
                    Hopefully satisfying following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I)).

          QAGIE-S   The routine calculates an approximation result to a given
          DQAGIE-D  integral   I = Integral of F over (BOUND,+INFINITY)
                            or I = Integral of F over (-INFINITY,BOUND)
                            or I = Integral of F over (-INFINITY,+INFINITY),
                            hopefully satisfying following claim for accuracy
                            ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I))

H2A4A2.  Nonautomatic

          QK15I-S   The original (infinite integration range is mapped
          DQK15I-D  onto the interval (0,1) and (A,B) is a part of (0,1).
                    it is the purpose to compute
                    I = Integral of transformed integrand over (A,B),
                    J = Integral of ABS(Transformed Integrand) over (A,B).


## I. Differential and integral equations

### I1. Ordinary differential equations

I1A.  Initial value problems
I1A1.  General, nonstiff or mildly stiff

I1A1A.  One-step methods
(e.g., Runge-Kutta)

          DERKF-S   Solve an initial value problem in ordinary differential
          DDERKF-D  equations using a Runge-Kutta-Fehlberg scheme.

I1A1B.  Multistep methods
(e.g., Adams' predictor-corrector)

          DEABM-S   Solve an initial value problem in ordinary differential
          DDEABM-D  equations using an Adams-Bashforth method.

          SDRIV1-S  The function of SDRIV1 is to solve N (200 or fewer)
          DDRIV1-D  ordinary differential equations of the form
          CDRIV1-C  dY(I)/dT = F(Y(I),T), given the initial conditions
                    Y(I) = YI.  SDRIV1 uses single precision arithmetic.

          SDRIV2-S  The function of SDRIV2 is to solve N ordinary differential
          DDRIV2-D  equations of the form dY(I)/dT = F(Y(I),T), given the
          CDRIV2-C  initial conditions Y(I) = YI.  The program has options to
                    allow the solution of both stiff and non-stiff differential
                    equations.  SDRIV2 uses single precision arithmetic.

          SDRIV3-S  The function of SDRIV3 is to solve N ordinary differential
          DDRIV3-D  equations of the form dY(I)/dT = F(Y(I),T), given the
          CDRIV3-C  initial conditions Y(I) = YI.  The program has options to
                    allow the solution of both stiff and non-stiff differential
                    equations.  Other important options are available.  SDRIV3
                    uses single precision arithmetic.

          SINTRP-S  Approximate the solution at XOUT by evaluating the
          DINTP-D   polynomial computed in STEPS at XOUT.  Must be used in
                    conjunction with STEPS.

          STEPS-S   Integrate a system of first order ordinary differential
          DSTEPS-D  equations one step.

I1A2.  Stiff and mixed algebraic-differential equations

          DEBDF-S   Solve an initial value problem in ordinary differential
          DDEBDF-D  equations using backward differentiation formulas.  It is
                    intended primarily for stiff problems.

          SDASSL-S  This code solves a system of differential/algebraic
          DDASSL-D  equations of the form G(T,Y,YPRIME) = 0.

          SDRIV1-S  The function of SDRIV1 is to solve N (200 or fewer)
          DDRIV1-D  ordinary differential equations of the form
          CDRIV1-C  dY(I)/dT = F(Y(I),T), given the initial conditions
                    Y(I) = YI.  SDRIV1 uses single precision arithmetic.

          SDRIV2-S  The function of SDRIV2 is to solve N ordinary differential
          DDRIV2-D  equations of the form dY(I)/dT = F(Y(I),T), given the
          CDRIV2-C  initial conditions Y(I) = YI.  The program has options to
                    allow the solution of both stiff and non-stiff differential
                    equations.  SDRIV2 uses single precision arithmetic.

          SDRIV3-S  The function of SDRIV3 is to solve N ordinary differential
          DDRIV3-D  equations of the form dY(I)/dT = F(Y(I),T), given the
          CDRIV3-C  initial conditions Y(I) = YI.  The program has options to
                    allow the solution of both stiff and non-stiff differential
                    equations.  Other important options are available.  SDRIV3
                    uses single precision arithmetic.

I1B.  Multipoint boundary value problems
I1B1.  Linear

          BVSUP-S   Solve a linear two-point boundary value problem using
          DBVSUP-D  superposition coupled with an orthonormalization procedure
                    and a variable-step integration scheme.

### I2. Partial differential equations

I2B.  Elliptic boundary value problems
I2B1.  Linear
I2B1A.  Second order
I2B1A1.  Poisson (Laplace) or Helmholz equation
I2B1A1A.  Rectangular domain (or topologically rectangular in the coordinate
          system)

          HSTCRT-S  Solve the standard five-point finite difference
                    approximation on a staggered grid to the Helmholtz equation
                    in Cartesian coordinates.

          HSTCSP-S  Solve the standard five-point finite difference
                    approximation on a staggered grid to the modified Helmholtz
                    equation in spherical coordinates assuming axisymmetry
                    (no dependence on longitude).

          HSTCYL-S  Solve the standard five-point finite difference
                    approximation on a staggered grid to the modified
                    Helmholtz equation in cylindrical coordinates.

          HSTPLR-S  Solve the standard five-point finite difference
                    approximation on a staggered grid to the Helmholtz equation
                    in polar coordinates.

          HSTSSP-S  Solve the standard five-point finite difference
                    approximation on a staggered grid to the Helmholtz
                    equation in spherical coordinates and on the surface of
                    the unit sphere (radius of 1).

          HW3CRT-S  Solve the standard seven-point finite difference
                    approximation to the Helmholtz equation in Cartesian
                    coordinates.

          HWSCRT-S  Solves the standard five-point finite difference
                    approximation to the Helmholtz equation in Cartesian
                    coordinates.

          HWSCSP-S  Solve a finite difference approximation to the modified
                    Helmholtz equation in spherical coordinates assuming
                    axisymmetry  (no dependence on longitude).

          HWSCYL-S  Solve a standard finite difference approximation
                    to the Helmholtz equation in cylindrical coordinates.

          HWSPLR-S  Solve a finite difference approximation to the Helmholtz
                    equation in polar coordinates.

          HWSSSP-S  Solve a finite difference approximation to the Helmholtz
                    equation in spherical coordinates and on the surface of the
                    unit sphere (radius of 1).

I2B1A2.  Other separable problems

          SEPELI-S  Discretize and solve a second and, optionally, a fourth
                    order finite difference approximation on a uniform grid to
                    the general separable elliptic partial differential
                    equation on a rectangle with any combination of periodic or
                    mixed boundary conditions.

          SEPX4-S   Solve for either the second or fourth order finite
                    difference approximation to the solution of a separable
                    elliptic partial differential equation on a rectangle.
                    Any combination of periodic or mixed boundary conditions is
                    allowed.

I2B4.  Service routines
I2B4B.  Solution of discretized elliptic equations

          BLKTRI-S  Solve a block tridiagonal system of linear equations
          CBLKTR-C  (usually resulting from the discretization of separable
                    two-dimensional elliptic equations).

          GENBUN-S  Solve by a cyclic reduction algorithm the linear system
          CMGNBN-C  of equations that results from a finite difference
                    approximation to certain 2-d elliptic PDE's on a centered
                    grid .

          POIS3D-S  Solve a three-dimensional block tridiagonal linear system
                    which arises from a finite difference approximation to a
                    three-dimensional Poisson equation using the Fourier
                    transform package FFTPAK written by Paul Swarztrauber.

          POISTG-S  Solve a block tridiagonal system of linear equations
                    that results from a staggered grid finite difference
                    approximation to 2-D elliptic PDE's.


## J. Integral transforms

### J1. Fast Fourier transforms
(search class L10 for time series analysis)

          FFTDOC-A  Documentation for FFTPACK, a collection of Fast Fourier
                    Transform routines.

J1A.  One-dimensional
J1A1.  Real

          EZFFTB-S  A simplified real, periodic, backward fast Fourier
                    transform.

          EZFFTF-S  Compute a simplified real, periodic, fast Fourier forward
                    transform.

          EZFFTI-S  Initialize a work array for EZFFTF and EZFFTB.

          RFFTB1-S  Compute the backward fast Fourier transform of a real
          CFFTB1-C  coefficient array.

          RFFTF1-S  Compute the forward transform of a real, periodic sequence.
          CFFTF1-C

          RFFTI1-S  Initialize a real and an integer work array for RFFTF1 and
          CFFTI1-C  RFFTB1.

J1A2.  Complex

          CFFTB1-C  Compute the unnormalized inverse of CFFTF1.
          RFFTB1-S

          CFFTF1-C  Compute the forward transform of a complex, periodic
          RFFTF1-S  sequence.

          CFFTI1-C  Initialize a real and an integer work array for CFFTF1 and
          RFFTI1-S  CFFTB1.

J1A3.  Trigonometric (sine, cosine)

          COSQB-S   Compute the unnormalized inverse cosine transform.

          COSQF-S   Compute the forward cosine transform with odd wave numbers.

          COSQI-S   Initialize a work array for COSQF and COSQB.

          COST-S    Compute the cosine transform of a real, even sequence.

          COSTI-S   Initialize a work array for COST.

          SINQB-S   Compute the unnormalized inverse of SINQF.

          SINQF-S   Compute the forward sine transform with odd wave numbers.

          SINQI-S   Initialize a work array for SINQF and SINQB.

          SINT-S    Compute the sine transform of a real, odd sequence.

          SINTI-S   Initialize a work array for SINT.

### J4. Hilbert transforms

          QAWC-S    The routine calculates an approximation result to a
          DQAWC-D   Cauchy principal value I = INTEGRAL of F*W over (A,B)
                    (W(X) = 1/((X-C), C.NE.A, C.NE.B), hopefully satisfying
                    following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABE,EPSREL*ABS(I)).

          QAWCE-S   The routine calculates an approximation result to a
          DQAWCE-D  CAUCHY PRINCIPAL VALUE I = Integral of F*W over (A,B)
                    (W(X) = 1/(X-C), (C.NE.A, C.NE.B), hopefully satisfying
                    following claim for accuracy
                    ABS(I-RESULT).LE.MAX(EPSABS,EPSREL*ABS(I))

          QC25C-S   To compute I = Integral of F*W over (A,B) with
          DQC25C-D  error estimate, where W(X) = 1/(X-C)


## K. Approximation
> (search also class L8)

          BSPDOC-A  Documentation for BSPLINE, a package of subprograms for
                    working with piecewise polynomial functions
                    in B-representation.

### K1. Least squares (L-2) approximation

K1A.  Linear least squares
(search also classes D5, D6, D9)

K1A1.  Unconstrained
K1A1A.  Univariate data (curve fitting)
K1A1A1.  Polynomial splines (piecewise polynomials)

          EFC-S     Fit a piecewise polynomial curve to discrete data.
          DEFC-D    The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.

          FC-S      Fit a piecewise polynomial curve to discrete data.
          DFC-D     The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.
                    Equality and inequality constraints can be imposed on the
                    fitted curve.

K1A1A2.  Polynomials

          PCOEF-S   Convert the POLFIT coefficients to Taylor series form.
          DPCOEF-D

          POLFIT-S  Fit discrete data in a least squares sense by polynomials
          DPOLFT-D  in one variable.

K1A2.  Constrained
K1A2A.  Linear constraints

          EFC-S     Fit a piecewise polynomial curve to discrete data.
          DEFC-D    The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.

          FC-S      Fit a piecewise polynomial curve to discrete data.
          DFC-D     The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.
                    Equality and inequality constraints can be imposed on the
                    fitted curve.

          LSEI-S    Solve a linearly constrained least squares problem with
          DLSEI-D   equality and inequality constraints, and optionally compute
                    a covariance matrix.

          SBOCLS-S  Solve the bounded and constrained least squares
          DBOCLS-D  problem consisting of solving the equation
                              E*X = F  (in the least squares sense)
                     subject to the linear constraints
                                    C*X = Y.

          SBOLS-S   Solve the problem
          DBOLS-D        E*X = F (in the least  squares  sense)
                    with bounds on selected X values.

          WNNLS-S   Solve a linearly constrained least squares problem with
          DWNNLS-D  equality constraints and nonnegativity constraints on
                    selected variables.

K1B.  Nonlinear least squares
K1B1.  Unconstrained

          SCOV-S    Calculate the covariance matrix for a nonlinear data
          DCOV-D    fitting problem.  It is intended to be used after a
                    successful return from either SNLS1 or SNLS1E.

K1B1A.  Smooth functions
K1B1A1.  User provides no derivatives

          SNLS1-S   Minimize the sum of the squares of M nonlinear functions
          DNLS1-D   in N variables by a modification of the Levenberg-Marquardt
                    algorithm.

          SNLS1E-S  An easy-to-use code which minimizes the sum of the squares
          DNLS1E-D  of M nonlinear functions in N variables by a modification
                    of the Levenberg-Marquardt algorithm.

K1B1A2.  User provides first derivatives

          SNLS1-S   Minimize the sum of the squares of M nonlinear functions
          DNLS1-D   in N variables by a modification of the Levenberg-Marquardt
                    algorithm.

          SNLS1E-S  An easy-to-use code which minimizes the sum of the squares
          DNLS1E-D  of M nonlinear functions in N variables by a modification
                    of the Levenberg-Marquardt algorithm.

### K6. Service routines
> (e.g., mesh generation, evaluation of fitted functions)
> (search also class N5)

          BFQAD-S   Compute the integral of a product of a function and a
          DBFQAD-D  derivative of a B-spline.

          DBSPDR-D  Use the B-representation to construct a divided difference
          BSPDR-S   table preparatory to a (right) derivative calculation.

          BSPEV-S   Calculate the value of the spline and its derivatives from
          DBSPEV-D  the B-representation.

          BSPPP-S   Convert the B-representation of a B-spline to the piecewise
          DBSPPP-D  polynomial (PP) form.

          BSPVD-S   Calculate the value and all derivatives of order less than
          DBSPVD-D  NDERIV of all basis functions which do not vanish at X.

          BSPVN-S   Calculate the value of all (possibly) nonzero basis
          DBSPVN-D  functions at X.

          BSQAD-S   Compute the integral of a K-th order B-spline using the
          DBSQAD-D  B-representation.

          BVALU-S   Evaluate the B-representation of a B-spline at X for the
          DBVALU-D  function value or any of its derivatives.

          INTRV-S   Compute the largest integer ILEFT in 1 .LE. ILEFT .LE. LXT
          DINTRV-D  such that XT(ILEFT) .LE. X where XT(*) is a subdivision
                    of the X interval.

          PFQAD-S   Compute the integral on (X1,X2) of a product of a function
          DPFQAD-D  F and the ID-th derivative of a B-spline,
                    (PP-representation).

          PPQAD-S   Compute the integral on (X1,X2) of a K-th order B-spline
          DPPQAD-D  using the piecewise polynomial (PP) representation.

          PPVAL-S   Calculate the value of the IDERIV-th derivative of the
          DPPVAL-D  B-spline from the PP-representation.

          PVALUE-S  Use the coefficients generated by POLFIT to evaluate the
          DP1VLU-D  polynomial fit of degree L, along with the first NDER of
                    its derivatives, at a specified point.


## L. Statistics, probability

### L5. Function evaluation
> (search also class C)

L5A.  Univariate
L5A1.  Cumulative distribution functions, probability density functions
L5A1E.  Error function, exponential, extreme value

          ERF-S     Compute the error function.
          DERF-D

          ERFC-S    Compute the complementary error function.
          DERFC-D

### L6. Pseudo-random number generation
L6A.  Univariate
L6A14.  Negative binomial, normal

          RGAUSS-S  Generate a normally distributed (Gaussian) random number.

L6A21.  Uniform

          RAND-S    Generate a uniformly distributed random number.

          RUNIF-S   Generate a uniformly distributed random number.

### L7. Experimental design, including analysis of variance
L7A.  Univariate
L7A3.  Analysis of covariance

          CV-S      Evaluate the variance function of the curve obtained
          DCV-D     by the constrained B-spline fitting subprogram FC.

### L8. Regression

> (search also classes G, K)

L8A.  Linear least squares (L-2)
(search also classes D5, D6, D9)

L8A3.  Piecewise polynomial (i.e. multiphase or spline)

          EFC-S     Fit a piecewise polynomial curve to discrete data.
          DEFC-D    The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.

          FC-S      Fit a piecewise polynomial curve to discrete data.
          DFC-D     The piecewise polynomials are represented as B-splines.
                    The fitting is done in a weighted least squares sense.
                    Equality and inequality constraints can be imposed on the
                    fitted curve.


## N. Data handling

> (search also class L2)

### N1. Input, output

          SBHIN-S   Read a Sparse Linear System in the Boeing/Harwell Format.
          DBHIN-D   The matrix is read in and if the right hand side is also
                    present in the input file then it too is read in.  The
                    matrix is then modified to be in the SLAP Column format.

          SCPPLT-S  Printer Plot of SLAP Column Format Matrix.
          DCPPLT-D  Routine to print out a SLAP Column format matrix in a
                    "printer plot" graphical representation.

          STIN-S    Read in SLAP Triad Format Linear System.
          DTIN-D    Routine to read in a SLAP Triad format matrix and right
                    hand side and solution to the system, if known.

          STOUT-S   Write out SLAP Triad Format Linear System.
          DTOUT-D   Routine to write out a SLAP Triad format matrix and right
                    hand side and solution to the system, if known.

### N6. Sorting
N6A.  Internal
N6A1.  Passive
(i.e. construct pointer array, rank)

N6A1A.  Integer

          IPSORT-I  Return the permutation vector generated by sorting a given
          SPSORT-S  array and, optionally, rearrange the elements of the array.
          DPSORT-D  The array may be sorted in increasing or decreasing order.
          HPSORT-H  A slightly modified quicksort algorithm is used.

N6A1B.  Real

          SPSORT-S  Return the permutation vector generated by sorting a given
          DPSORT-D  array and, optionally, rearrange the elements of the array.
          IPSORT-I  The array may be sorted in increasing or decreasing order.
          HPSORT-H  A slightly modified quicksort algorithm is used.

N6A1C.  Character

          HPSORT-H  Return the permutation vector generated by sorting a
          SPSORT-S  substring within a character array and, optionally,
          DPSORT-D  rearrange the elements of the array.  The array may be
          IPSORT-I  sorted in forward or reverse lexicographical order.  A
                    slightly modified quicksort algorithm is used.

N6A2.  Active
N6A2A.  Integer

          IPSORT-I  Return the permutation vector generated by sorting a given
          SPSORT-S  array and, optionally, rearrange the elements of the array.
          DPSORT-D  The array may be sorted in increasing or decreasing order.
          HPSORT-H  A slightly modified quicksort algorithm is used.

          ISORT-I   Sort an array and optionally make the same interchanges in
          SSORT-S   an auxiliary array.  The array may be sorted in increasing
          DSORT-D   or decreasing order.  A slightly modified QUICKSORT
                    algorithm is used.

N6A2B.  Real

          SPSORT-S  Return the permutation vector generated by sorting a given
          DPSORT-D  array and, optionally, rearrange the elements of the array.
          IPSORT-I  The array may be sorted in increasing or decreasing order.
          HPSORT-H  A slightly modified quicksort algorithm is used.

          SSORT-S   Sort an array and optionally make the same interchanges in
          DSORT-D   an auxiliary array.  The array may be sorted in increasing
          ISORT-I   or decreasing order.  A slightly modified QUICKSORT
                    algorithm is used.

N6A2C.  Character

          HPSORT-H  Return the permutation vector generated by sorting a
          SPSORT-S  substring within a character array and, optionally,
          DPSORT-D  rearrange the elements of the array.  The array may be
          IPSORT-I  sorted in forward or reverse lexicographical order.  A
                    slightly modified quicksort algorithm is used.

### N8. Permuting

          SPPERM-S  Rearrange a given array according to a prescribed
          DPPERM-D  permutation vector.
          IPPERM-I
          HPPERM-H


## R. Service routines

### R1. Machine-dependent constants

          I1MACH-I  Return integer machine dependent constants.

          R1MACH-S  Return floating point machine dependent constants.
          D1MACH-D

### R2. Error checking

(e.g., check monotonicity)

          GAMLIM-S  Compute the minimum and maximum bounds for the argument in
          DGAMLM-D  the Gamma function.

### R3. Error handling

          FDUMP-A   Symbolic dump (should be locally written).

R3A.  Set criteria for fatal errors

          XSETF-A   Set the error control flag.

R3B.  Set unit number for error messages

          XSETUA-A  Set logical unit numbers (up to 5) to which error
                    messages are to be sent.

          XSETUN-A  Set output file to which error messages are to be sent.

R3C.  Other utility programs

          NUMXER-I  Return the most recent error number.

          XERCLR-A  Reset current error number to zero.

          XERDMP-A  Print the error tables and then clear them.

          XERMAX-A  Set maximum number of times any error message is to be
                    printed.

          XERMSG-A  Process error messages for SLATEC and other libraries.

          XGETF-A   Return the current value of the error control flag.

          XGETUA-A  Return unit number(s) to which error messages are being
                    sent.

          XGETUN-A  Return the (first) output file to which error messages
                    are being sent.


## Z. Other

- [`FNLIB`](@ref): `FUNDOC-A`,
    Documentation for FNLIB, a collection of routines for
    evaluating elementary and special functions.

          AAAAAA-A  SLATEC Common Mathematical Library disclaimer and version.

          BSPDOC-A  Documentation for BSPLINE, a package of subprograms for
                    working with piecewise polynomial functions
                    in B-representation.

          EISDOC-A  Documentation for EISPACK, a collection of subprograms for
                    solving matrix eigen-problems.

          FFTDOC-A  Documentation for FFTPACK, a collection of Fast Fourier
                    Transform routines.

          FUNDOC-A  Documentation for FNLIB, a collection of routines for
                    evaluating elementary and special functions.

          PCHDOC-A  Documentation for PCHIP, a Fortran package for piecewise
                    cubic Hermite interpolation of data.

          QPDOC-A   Documentation for QUADPACK, a package of subprograms for
                    automatic evaluation of one-dimensional definite integrals.

          SLPDOC-S  Sparse Linear Algebra Package Version 2.0.2 Documentation.
          DLPDOC-D  Routines to solve large sparse symmetric and nonsymmetric
                    positive definite linear systems, Ax = b, using precondi-
                    tioned iterative methods.
