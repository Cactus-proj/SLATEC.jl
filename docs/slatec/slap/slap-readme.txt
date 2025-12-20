===== readme for slap =====

PURPOSE  Sparse Linear Algebra Package Version 2.0
        Routines to  solve large sparse symmetric and nonsymmetric 
        positive definite linear systems, Ax = b, using precondit-
        ioned iterative methods.

        This package was originally derived from a set of iterative
        routines written by Anne Greenbaum, "Routines for Solving
        Large Sparse Linear Systems", Lawrence Livermore Nat.
        Laboratory, Livermore Computing Center, January 1986 
        Tentacle, pp 15-21.

DESCRIPTION
                             The
                Sparse Linear Algebra Package
                      SLAP Version 2.0
 
=================================================================
========================== Introduction =========================
=================================================================
This document  contains the specifications for  the  SLAP Version
2.0 package, a Fortran 77  package  for  the  solution  of  large
sparse   linear systems, Ax  =  b,  via  preconditioned iterative
methods.   Included in  this  package are "core"  routines  to do
Iterative   Refinement  (Jacobi's  method),  Conjugate  Gradient,
Conjugate Gradient on the normal equations, AA'y = b,  (where x =
A'y and  A' denotes the  transpose of   A), BiConjugate Gradient,
BiConjugate  Gradient  Squared, Orthomin and  Generalized Minimum
Residual Iteration.    These "core" routines   do  not  require a
"fixed"   data  structure   for storing  the   matrix  A  and the
preconditioning   matrix  M.   The  user  is free  to  choose any
structure that facilitates  efficient solution  of the problem at
hand.  The drawback  to this approach  is that the user must also
supply at least two routines  (MATVEC and MSOLVE,  say).   MATVEC
must calculate, y = Ax, given x and the user's data structure for
A.  MSOLVE must solve,  r = Mz, for z (*NOT*  r) given r  and the
user's data  structure for  M (or its  inverse).  The user should
choose   M  so that MA   is  approximately the   identity and the
solution step r = Mz is "easy" to  solve.  For some of the "core"
routines (Orthomin,  BiConjugate Gradient and  Conjugate Gradient
on the  normal equations)   the user must  also  supply  a matrix
transpose times   vector  routine  (MTTVEC,  say)  and (possibly,
depending    on the "core"  method)   a  routine  that solves the
transpose  of   the   preconditioning    step     (MTSOLV,  say).
Specifically, MTTVEC is a routine which calculates y = A'x, given
x and the user's data structure for A (A' is the transpose of A).
MTSOLV is a routine which solves the system r = M'z for z given r
and the user's data structure for M.

AUTHOR  Seager, Mark. K., (LLNL)
         User Systems Division
         Lawrence Livermore National Laboratory
         PO BOX 808, L-300
         Livermore, CA 94550
         (FTS) 543-3141, (415) 423-3141
         seager@lll-crg.llnl.gov

REFERENCES  1. M. Seager, ``A SLAP for the Masses,'' Lawrence 
             Livermore Nat. Laboratory Technical Report, 
             UCRL-100267, December 1988.

