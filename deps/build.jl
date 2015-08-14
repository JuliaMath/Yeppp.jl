using BinDeps

#@BinDeps.setup
ver = "1.0.0"
run(download_cmd("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2", "yeppp-$ver.tar.bz2"))
run(unpack_cmd("yeppp-$ver.tar.bz2", ".", ".bz2", ".tar"))

@windows_only run(`cp yeppp-$ver/binaries/windows/amd64/yeppp.dll yeppp-$ver/binaries/windows/amd64/yeppp.lib yeppp-$ver/binaries/windows/amd64/yeppp.pdb .`)
@osx_only run(`cp yeppp-$ver/binaries/macosx/x86_64/libyeppp.dylib yeppp-$ver/binaries/macosx/x86_64/libyeppp.dylib.dSYM .`)
@linux_only run(`cp yeppp-$ver/binaries/linux/x86_64/libyeppp.dbg yeppp-$ver/binaries/linux/x86_64/libyeppp.so .`)
# provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-1.0.0.tar.bz2"))

#@BinDeps.install 
