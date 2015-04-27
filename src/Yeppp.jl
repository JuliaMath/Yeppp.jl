module Yeppp

@unix_only    const libyeppp = "libyeppp"
@windows_only const libyeppp = "yeppp"

function __init__()
    const status = ccall( (:yepLibrary_Init, libyeppp), Cint, ())
    status != 0 && error("yepLibrary_Init: error: ", status)
end

function release()
    const status = ccall( (:yepLibrary_Release, libyeppp), Cint, ())
    status != 0 && error("yepLibrary_Release: error: ", status)
end

macro yepppfunsAA_A(fname, libname, BT)
    errorname = libname * ": error: "
    quote 
        global $(fname)
        function $(fname)(res::Array{$(BT)}, x::Array{$(BT)}, y::Array{$(BT)})
            n = length(x)
            assert(n == length(y) == length(res))
            
            const status = ccall( ($(libname), libyeppp), Cint, (Ptr{$(BT)}, Ptr{$(BT)}, Ptr{$(BT)}, Culong), x, y, res, n)
            status != 0 && error($(errorname), status)
            res
        end
    end 
end 

macro yepppfunsA_A(fname, libname, BT)
    errorname = libname * ": error: "
    quote 
        global $(fname)
        function $(fname)(res::Array{$(BT)}, x::Array{$(BT)})
            n = length(x)
            assert(n == length(res))
            
            const status = ccall( ($(libname), libyeppp), Cint, (Ptr{$(BT)}, Ptr{$(BT)}, Culong), x, res, n)
            status != 0 && error($(errorname), status)
            res
        end
    end 
end 

macro yepppfunsA_S(fname, libname, BT)
    errorname = libname * ": error: "
    quote 
        global $(fname)
        function $(fname)(x::Array{$(BT)})
            n = length(x)
            res = Array($(BT), 1)
            const status = ccall( ($(libname), libyeppp), Cint, (Ptr{$(BT)}, Ptr{$(BT)}, Culong), x, res, n)
            status != 0 && error($(errorname), status)
            res[1]
        end
    end 
end 

@yepppfunsAA_A add! "yepCore_Add_V64fV64f_V64f" Float64
@yepppfunsAA_A multiply! "yepCore_Multiply_V64fV64f_V64f" Float64
@yepppfunsAA_A subtract! "yepCore_Subtract_V64fV64f_V64f" Float64
@yepppfunsAA_A max! "yepCore_Max_V64fV64f_V64f" Float64
@yepppfunsAA_A min! "yepCore_Min_V64fV64f_V64f" Float64

# @yepppfunsA_A negate "yepCore_Negate_IV64f_IV64f Float64
@yepppfunsA_A log! "yepMath_Log_V64f_V64f" Float64
@yepppfunsA_A exp! "yepMath_Exp_V64f_V64f" Float64
@yepppfunsA_A sin! "yepMath_Sin_V64f_V64f" Float64
@yepppfunsA_A cos! "yepMath_Cos_V64f_V64f" Float64
@yepppfunsA_A tan! "yepMath_Tan_V64f_V64f" Float64

@yepppfunsA_S sum "yepCore_Sum_V64f_S64f" Float64
@yepppfunsA_S sumabs "yepCore_SumAbs_V64f_S64f" Float64
@yepppfunsA_S sumabs2 "yepCore_SumSquares_V64f_S64f" Float64

function dot(x::Vector{Float64}, y::Vector{Float64})
    n = length(x)
    assert(n == length(y))
    dotproduct = Array(Float64, 1)
    const status = ccall( (:yepCore_DotProduct_V64fV64f_S64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, dotproduct, n)
    status != 0 && error("yepCore_DotProduct_V64fV64f_S64f: error: ", status)
    dotproduct[1]
end

max(x, y) = max!(similar(x), x, y)

min(x, y) = min!(similar(x), x, y)

function evalpoly!(res::Array{Float64}, coef::Array{Float64}, x::Array{Float64})
    n = length(coef)
    assert(n == length(res))
    arraysize = length(x)
    const status = ccall( (:yepMath_EvaluatePolynomial_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong, Culong), coef, x, res, n, arraysize)
    status != 0 && error("yepMath_EvaluatePolynomial_V64fV64f_V64f: error: ", status)
    res
end

evalpoly(coef, x) = evalpoly!(similar(x), coef, x)

subtract(x::Array, y::Array) = subtract!(similar(x), x, y)

multiply(x, y) = multiply!(similar(x), x, y)

log(x) = log!(similar(x), x)

exp(x) = exp!(similar(x), x)

sin(x) = sin!(similar(x), x)

cos(x) = cos!(similar(x), x)

tan(x) = tan!(similar(x), x)

end # module
