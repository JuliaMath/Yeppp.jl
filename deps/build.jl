using BinDeps
using Compat
ver = "1.0.0"
@BinDeps.setup
libyepppdep = library_dependency("libyeppp", aliases=["yeppp"])
if Sys.ARCH != :x86_64
    warn("Your package is not built successfully. You can still use this package if downding Yeppp! and adding the binary library file corresponding to your platform to the search path.")
else

    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/windows/amd64/", os = :Windows)
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/macosx/x86_64/", os = :Darwin)
    @linux_only push!(BinDeps.defaults, Binaries)
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/linux/x86_64/", os = :Linux)
end
@compat @BinDeps.install Dict(:libyeppp => :libyeppp)
