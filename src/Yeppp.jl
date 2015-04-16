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


function dot(x::Vector{Float64}, y::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    dotproduct = Array(Float64, 1)
    const status = ccall( (:yepCore_DotProduct_V64fV64f_S64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, dotproduct, n)
    status != 0 && error("yepCore_DotProduct_V64fV64f_S64f: error: ", status)
    dotproduct[1]
end

function sum(v::Array{Float64})
    n = length(v)
    local s::Array{Float64} = Array(Float64, 1)
    const status = ccall( (:yepCore_Sum_V64f_S64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), v, s, n)
    status != 0 && error("yepCore_Sum_V64f_S64f: error: ", status)
    s[1]
end

function sumabs(v::Array{Float64})
    n = length(v)
    s = Array(Float64, 1)
    const status = ccall( (:yepCore_SumAbs_V64f_S64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), v, s, n)
    status != 0 && error("yepCore_SumAbs_V64f_S64f: error: ", status)
    s[1]
end

function sumabs2(v::Array{Float64})
    n = length(v)
    s = Array(Float64, 1)
    const status = ccall( (:yepCore_SumSquares_V64f_S64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), v, s, n)
    status != 0 && error("yepCore_SumSquares_V64f_S64f: error: ", status)
    s[1]
end

function max!(res::Array{Float64}, x::Array{Float64}, y::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Max_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Max_V64fV64f_V64f: error: ", status)
    res
end

max(x, y) = max!(similar(x), x, y)

function min!(res::Array{Float64}, y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Min_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Min_V64fV64f_V64f: error: ", status)
    res
end

min(x, y) = min!(similar(x), x, y)

function evalpoly!(res::Array{Float64}, coef::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(res))
    n = length(coef)
    arraysize = length(x)
    const status = ccall( (:yepMath_EvaluatePolynomial_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong, Culong), coef, x, res, n, arraysize)
    status != 0 && error("yepMath_EvaluatePolynomial_V64fV64f_V64f: error: ", status)
    res
end

evalpoly(coef, x) = evalpoly!(similar(x), coef, x)

function add!(res::Array{Float64}, x::Array{Float64}, y::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Add_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Add_V64fV64f_V64f: error: ", status)
    res
end

function add!(res::Array{Float64}, x::Array{Float64}, y::Float64)
    n = length(x)
    assert(length(res) == n)
    const status = ccall( (:yepCore_Add_V64fS64f_V64f, libyeppp), Cint, (Ptr{Float64}, Cdouble, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Add_V64fS64f_V64f: error: ", status)
    res
end

add(x, y) = add!(similar(x), x, y)

function subtract!(res::Array{Float64}, x::Array{Float64}, y::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Subtract_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Subtract_V64fV64f_V64f: error: ", status)
    res
end

#x - constant_y
function subtract!(res::Array{Float64}, x::Array{Float64}, y::Float64)
    n = length(x)
    assert(length(res) == n)
    const status = ccall( (:yepCore_Subtract_V64fS64f_V64f, libyeppp), Cint, (Ptr{Float64}, Cdouble, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Subtract_V64fS64f_V64f: error: ", status)
    res
end

#constant_x - y
function subtract!(res::Array{Float64}, x::Float64, y::Array{Float64})
    n = length(y)
    assert(length(res) == n)
    const status = ccall( (:yepCore_Subtract_S64fV64f_V64f, libyeppp), Cint, (Cdouble, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Subtract_S64fV64f_V64f: error: ", status)
    res
end

subtract(x::Array, y::Array) = subtract!(similar(x), x, y)
subtract(x::Array, y::Float64) = subtract!(similar(x), x, y)
subtract(x::Float64, y::Array) = subtract!(similar(y), x, y)

function multiply!(res::Array{Float64}, x::Array{Float64}, y::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Multiply_V64fV64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Multiply_V64fV64f_V64f: error: ", status)
    res
end

# x .* constant_y
function multiply!(res::Array{Float64}, x::Array{Float64}, y::Float64)
    n = length(x)
    assert(length(res) == n)
    const status = ccall( (:yepCore_Multiply_V64fS64f_V64f, libyeppp), Cint, (Ptr{Float64}, Cdouble, Ptr{Float64}, Culong), x, y, res, n)
    status != 0 && error("yepCore_Multiply_V64fS64f_V64f: error: ", status)
    res
end

multiply(x, y) = multiply!(similar(x), x, y)

function negate!(v::Array{Float64})
    n = length(v)
    const status = ccall( (:yepCore_Negate_IV64f_IV64f, libyeppp), Cint, (Ptr{Float64}, Culong), v, n)
    status != 0 && error("yepCore_Negate_IV64f_IV64f: error: ", status)
    v
end

function log!(y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Log_V64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), x, y, n)
    status != 0 && error("yepMath_Log_V64f_V64f: error: ", status)
    y
end

log(x) = log!(similar(x), x)

function exp!(y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Exp_V64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), x, y, n)
    status != 0 && error("yepMath_Exp_V64f_V64f: error: ", status)
    y
end

exp(x) = exp!(similar(x), x)

function sin!(y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Sin_V64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), x, y, n)
    status != 0 && error("yepMath_Sin_V64f_V64f: error: ", status)
    y
end

sin(x) = sin!(similar(x), x)

function cos!(y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Cos_V64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), x, y, n)
    status != 0 && error("yepMath_Cos_V64f_V64f: error: ", status)
    y
end

cos(x) = cos!(similar(x), x)

function tan!(y::Array{Float64}, x::Array{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Tan_V64f_V64f, libyeppp), Cint, (Ptr{Float64}, Ptr{Float64}, Culong), x, y, n)
    status != 0 && error("yepMath_Tan_V64f_V64f: error: ", status)
    y
end

tan(x) = tan!(similar(x), x)

end # module
