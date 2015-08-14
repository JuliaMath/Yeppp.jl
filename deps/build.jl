using BinDeps

#@BinDeps.setup
ver = "1.0.0"
run(download_cmd("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-$ver.tar.bz2", "yeppp-$ver.tar.bz2"))
run(unpack_cmd("yeppp-$ver.tar.bz2", ".", ".bz2", ".tar"))

@windows_only begin
    if Sys.WORD_SIZE == 64
        wsize = "amd64"
    else
        wsize = "x86"
    end
    run(`cp yeppp-$ver/binaries/windows/$wsize/yeppp.dll yeppp-$ver/binaries/windows/$wsize/yeppp.lib yeppp-$ver/binaries/windows/$wsize/yeppp.pdb .`)
end
@osx_only begin
    if Sys.WORD_SIZE == 64
        wsize = "x86_64"
    else
        wsize = "x86"
    end
    run(`cp yeppp-$ver/binaries/macosx/$wsize/libyeppp.dylib yeppp-$ver/binaries/macosx/$wsize/libyeppp.dylib.dSYM .`)
end
@linux_only begin 
    if Sys.WORD_SIZE == 64
        wsize = "x86_64"
    else
        wsize = "i586"
    end
    run(`cp yeppp-$ver/binaries/linux/$wsize/libyeppp.dbg yeppp-$ver/binaries/linux/$wsize/libyeppp.so .`)
end
# provides(Binaries, URI("http://bitbucket.org/MDukhan/yeppp/downloads/yeppp-1.0.0.tar.bz2"))

#@BinDeps.install 
