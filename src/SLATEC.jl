# SPDX-License-Identifier: MIT
"""
SLATEC Common Mathematical Library,
a comprehensive software library containing over
1400 general purpose mathematical and statistical routines.

# Submodules

- [`FNLIB`](@ref): Special functions

# References

- [netlib/slatec](https://www.netlib.org/slatec/)
- Vandevender, W. H., & Haskell, K. H. (1982). The SLATEC mathematical subroutine library.
    ACM Signum Newsletter, 17(3), 16-21.
    https://doi.org/10.1145/1057594.105759
"""
module SLATEC

import OpenBLAS32
import SLATEC_jll

include("fnlib.jl")

end # module SLATEC