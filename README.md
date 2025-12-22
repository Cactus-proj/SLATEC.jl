# SLATEC

Julia wrapper for [SLATEC](https://www.netlib.org/slatec/) Common Mathematical Library.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://inkydragon.github.io/SLATEC.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://inkydragon.github.io/SLATEC.jl/dev/)
[![Build Status](https://github.com/inkydragon/SLATEC.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/inkydragon/SLATEC.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/inkydragon/SLATEC.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/inkydragon/SLATEC.jl)

> SLATEC Common Mathematical Library,
> a comprehensive software library containing over
> 1400 general purpose mathematical and statistical routines.

## Overview

SLATEC includes all or some of the following packages:

- `BLAS`, basic linear algebra subprograms
  - Use [OpenBLAS](https://github.com/OpenMathLib/OpenBLAS)
- `DASSL`, the solution of differential/algebraic systems
- `DEPAC`, the solution of systems of differential equations
- `SLAP,DLAP`, the solution of double precision or single precision sparse systems of linear equations
  - Use https://github.com/DrTimothyAldenDavis/SuiteSparse
- `EISPACK`, the computation of eigenvalues and eigenvectors.  
    [EISPACK has been superseded for the most part by `LAPACK`](https://www.netlib.org/eispack/index.html)
- `FFTPACK`, fast Fourier transforms
  - Use [FFTW](https://www.fftw.org/)
  - https://github.com/fortran-lang/fftpack
- `FISHPACK`, finite differences for elliptic boundary value problems
- `FNLIB`, special functions
  - Use https://github.com/scipy/xsf
- `LINPACK`, solving systems of linear equations.  
    [LINPACK has been largely superceded by `LAPACK`](https://www.netlib.org/linpack/index.html)
- `MACHINE`, machine arithmetic constants
- `MINPACK`, minimization
  - https://github.com/fortran-lang/minpack
- `PCHIP`, piecewise cubic Hermite interpolation of data
  - [Piecewise Cubic Hermite Interpolation Package. Final specifications (Technical Report) | OSTI.GOV](https://www.osti.gov/biblio/6838406)
  - https://github.com/jacobwilliams/PCHIP
- `QUADPACK`, quadrature over finite or infinite 1D intervals
  - https://github.com/jacobwilliams/quadpack
- `XERROR`, error handling

NOTE: Focus on `fnlib` for now.


## License

```c
// SPDX-License-Identifier: MIT
```

- `SLATEC` is in the `public domain`, since it was developed at U.S. government research laboratories.
- This Julia wrapper (`SLATEC.jl`) is licensed under MIT License. See [`LICENSE`](LICENSE) file details.

## References

- [netlib/slatec](https://www.netlib.org/slatec/)
- [GAMS: Package SLATEC](https://gams.nist.gov/cgi-bin/serve.cgi/Package/SLATEC)
  - [GAMS: Modules in Package SLATEC](https://gams.nist.gov/cgi-bin/serve.cgi/PackageModules/SLATEC)
- Vandevender, W. H., & Haskell, K. H. (1982). The SLATEC mathematical subroutine library.
    ACM Signum Newsletter, 17(3), 16-21.
    https://doi.org/10.1145/1057594.105759
