module Yeppp

function __init__()
    const status = ccall( (:yepLibrary_Init, "libyeppp"), Int32, ())
    status != 0 && error("yepLibrary_Init: error: ", status)
end

function release()
    const status = ccall( (:yepLibrary_Release, "libyeppp"), Int32, ())
    status != 0 && error("yepLibrary_Release: error: ", status)
end


function dot(x::Vector{Float64}, y::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    dotproduct = Array(Float64, 1)
    const status = ccall( (:yepCore_DotProduct_V64fV64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, dotproduct, n)
    status != 0 && error("yepCore_DotProduct_V64fV64f_S64f: error: ", status)
    dotproduct[1]
end

function sum(v::Vector{Float64})
    n = length(v)
    local s::Vector{Float64} = Array(Float64, 1)
    const status = ccall( (:yepCore_Sum_V64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), v, s, n)
    status != 0 && error("yepCore_Sum_V64f_S64f: error: ", status)
    s[1]
end

function sumabs(v::Vector{Float64})
    n = length(v)
    s = Array(Float64, 1)
    const status = ccall( (:yepCore_SumAbs_V64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), v, s, n)
    status != 0 && error("yepCore_SumAbs_V64f_S64f: error: ", status)
    s[1]
end

function sumabs2(v::Vector{Float64})
    n = length(v)
    s = Array(Float64, 1)
    const status = ccall( (:yepCore_SumSquares_V64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), v, s, n)
    status != 0 && error("yepCore_SumSquares_V64f_S64f: error: ", status)
    s[1]
end

function max!(res::Vector{Float64}, y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Max_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, res, n)
    status != 0 && error("yepCore_Max_V64fV64f_V64f: error: ", status)
    res
end

function evalpoly!(res::Vector{Float64}, coef::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(res))
    n = length(coef)
    arraysize = length(x)
    const status = ccall( (:yepMath_EvaluatePolynomial_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint, Uint), coef, x, res, n, arraysize)
    status != 0 && error("yepMath_EvaluatePolynomial_V64fV64f_V64f: error: ", status)
    res
end

function min!(res::Vector{Float64}, y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Min_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, res, n)
    status != 0 && error("yepCore_Min_V64fV64f_V64f: error: ", status)
    res
end

function add!(res::Vector{Float64}, y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Add_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, res, n)
    status != 0 && error("yepCore_Add_V64fV64f_V64f: error: ", status)
    res
end

function subtract!(res::Vector{Float64}, y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Subtract_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, res, n)
    status != 0 && error("yepCore_Subtract_V64fV64f_V64f: error: ", status)
    res
end

function multiply!(res::Vector{Float64}, y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepCore_Multiply_V64fV64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, res, n)
    status != 0 && error("yepCore_Multiply_V64fV64f_V64f: error: ", status)
    res
end

function negate!(v::Vector{Float64})
    n = length(v)
    const status = ccall( (:yepCore_Negate_IV64f_IV64f, "libyeppp"), Int32, (Ptr{Float64}, Uint), v, n)
    status != 0 && error("yepCore_Negate_IV64f_IV64f: error: ", status)
    v
end

function log!(y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Log_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Log_V64f_V64f: error: ", status)
    y
end

function exp!(y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Exp_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Exp_V64f_V64f: error: ", status)
    y
end

function sin!(y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Sin_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Sin_V64f_V64f: error: ", status)
    y
end

function cos!(y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Cos_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Cos_V64f_V64f: error: ", status)
    y
end

function tan!(y::Vector{Float64}, x::Vector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Tan_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Tan_V64f_V64f: error: ", status)
    y
end

end # module
