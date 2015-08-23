using BinDeps
using Compat
@BinDeps.setup
ver = "1.0.0"
libyepppdep = library_dependency("libyeppp", aliases=["yeppp"])

@windows_only begin
    if Sys.WORD_SIZE == 64
        wsize = "amd64"
    else
        wsize = "x86"
    end
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/windows/$wsize/", os = :Windows)
end
@osx_only begin
    if Sys.WORD_SIZE == 64
        wsize = "x86_64"
    else
        wsize = "x86"
    end
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/macosx/$wsize/", os = :Darwin)
end
@linux_only begin 
    if Sys.ARCH == :x86_64
        wsize = "x86_64"
    elseif Sys.ARCH == :x86
        wsize = "i586"
    else
        warn("$(Sys.ARCH) is not currently supported.")
    end
    push!(BinDeps.defaults, Binaries)
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/linux/$wsize/", os = :Linux)
end
@compat @BinDeps.install Dict(:libyeppp => :libyeppp)

