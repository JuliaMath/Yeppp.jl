Yeppp bindings for Julia
========================

[Yeppp!](http://www.yeppp.info) is a high-performance SIMD-optimized
mathematical library. This Julia package makes it possible to
call Yeppp from Julia.

To use this package, [download
Yeppp](http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-1.0.0.zip)
and extract from the `binaries` folder the file(s) specific to your OS.
This is `yeppp.dll` on Windows and `libyeppp` file(s) on other OS.
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
subabs(x)
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

See the [Yeppp documentation](http://docs.yeppp.info/c/modules.html)
for the full set of functions available in Yeppp.
