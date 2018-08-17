Yeppp bindings for Julia
========================

Linux: [![Build Status](https://travis-ci.org/JuliaMath/Yeppp.jl.svg?branch=master)](https://travis-ci.org/JuliaMath/Yeppp.jl)

Windows: [![Build status](https://ci.appveyor.com/api/projects/status/yxtppqel13q8d8td?svg=true)](https://ci.appveyor.com/project/panlanfeng/yeppp-jl-2y32h)

[![Coverage Status](https://coveralls.io/repos/JuliaMath/Yeppp.jl/badge.svg?branch=master)](https://coveralls.io/r/JuliaMath/Yeppp.jl?branch=master)
[![codecov.io](http://codecov.io/github/JuliaMath/Yeppp.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaMath/Yeppp.jl?branch=master)

[Yeppp!](http://www.yeppp.info) is a high-performance SIMD-optimized
mathematical library. This Julia package makes it possible to
call Yeppp from Julia.

Install this package by

```julia
Pkg.add("Yeppp")
```

For common 64-bit platforms, this will download dependencies automatically. For some
other platforms such as the PowerPC 64 architecture, you may still be able to
use this package by [downloading
Yeppp!](http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-1.0.0.zip)
and extracting from the `binaries` folder the file(s) specific to your OS.
Check the platforms supported by Yeppp! [here](https://bitbucket.org/MDukhan/yeppp).
Make sure the extracted files are available on the system library
search path or in the current directory.  For example, in Julia's `bin` folder.

See example usage below. Yeppp's vectorized log is 3x faster than the
one in Base, which is written in Julia.

```julia
using Yeppp

x = rand(10^7)
ty = @elapsed Yeppp.log!(similar(x), x)
t  = @elapsed log(x)
t/ty
```

The following functions are available for `Array{Float64}`. Inputs
are in `x`, and outputs are in `y`.

```julia
dot(x1, x2)
sum(x)
sumabs(x)
sumabs2(x)
negate!(x)
max!(y, x1, x2)
min!(y, x1, x2)
add!(y, x1, x2)
subtract!(y, x1, x2)
multiply!(y, x1, x2)

log!(y, x)
exp!(y, x)
evalpoly!(y, x_coeff, x)

sin!(y, x)
cos!(y, x)
tan!(y, x)
```

See the [Yeppp! documentation](http://docs.yeppp.info/c/modules.html)
for the full set of functions available in Yeppp!.
