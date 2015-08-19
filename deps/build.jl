using BinDeps
using Compat
@BinDeps.setup
ver = "1.0.0"
@unix_only libyepppdep = library_dependency("libyeppp", alias=["yeppp"])
@windows_only libyepppdep = library_dependency("yeppp")

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
    if Sys.WORD_SIZE == 64
        wsize = "x86_64"
    else
        wsize = "i586"
    end
    provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2"), libyepppdep, unpacked_dir = "yeppp-$ver/binaries/linux/$wsize/", os = :Linux)
end
@unix_only @compat @BinDeps.install Dict(:libyeppp => :libyeppp)
@windows_only @compat @BinDeps.install Dict(:yeppp => :yeppp)

