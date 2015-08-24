Yeppp bindings for Julia
========================

Linux: [![Build Status](https://travis-ci.org/JuliaLang/Yeppp.jl.svg?branch=master)](https://travis-ci.org/JuliaLang/Yeppp.jl)

Windows: [![Build Status](https://ci.appveyor.com/api/projects/status/github/JuliaLang/Yeppp.jl?branch=master&svg=true)](https://ci.appveyor.com/project/panlanfeng/yeppp-jl/branch/master)

[Yeppp!](http://www.yeppp.info) is a high-performance SIMD-optimized
mathematical library. This Julia package makes it possible to
call Yeppp from Julia.

Install this package by 

```julia
Pkg.add("Yeppp")
```

For common 64-bit platforms, this will download depencency automatically. For some
other platforms such as PowerPC 64 architecture, you may still be able to 
use this package by [downloading
Yeppp!](http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-1.0.0.zip)
and extracting from the `binaries` folder the file(s) specific to your OS.
Check the platforms supported by Yeppp! [here](https://bitbucket.org/MDukhan/yeppp).
Make sure the extracted files are available on the system library
search path or in the current directory.  For example, in Julia's `bin` folder.

See example usage below. Yeppp's vectorized log is 7x faster than the
one in Base that uses [openlibm](http://www.openlibm.org/).

```julia
using Yeppp

x = rand(10^7)
ty = @elapsed Yeppp.log!(similar(x), x)
t  = @elapsed log(x)
t/ty
````

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
````

See the [Yeppp! documentation](http://docs.yeppp.info/c/modules.html)
for the full set of functions available in Yeppp!.
