module Yeppp

function __init__()
    const status = ccall( (:yepLibrary_Init, "libyeppp"), Int32, ())
    status != 0 && error("yepLibrary_Init: error: ", status)
end

function release()
    const status = ccall( (:yepLibrary_Release, "libyeppp"), Int32, ())
    status != 0 && error("yepLibrary_Release: error: ", status)
end

function sum(v::AbstractVector{Float64})
    n = length(v)
    local s::Vector{Float64} = Array(Float64, 1)
    const status = ccall( (:yepCore_Sum_V64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), v, s, n)
    status != 0 && error("yepCore_Sum_V64f_S64f: error: ", status)
    s[1]
end

function sumabs2(v::AbstractVector{Float64})
    n = length(v)
    s = Array(Float64, 1)
    const status = ccall( (:yepCore_SumSquares_V64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), v, s, n)
    status != 0 && error("yepCore_SumSquares_V64f_S64f: error: ", status)
    s[1]
end

function dot(x::AbstractVector{Float64}, y::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    dotproduct = Array(Float64, 1)
    const status = ccall( (:yepCore_DotProduct_V64fV64f_S64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Uint), x, y, dotproduct, n)
    status != 0 && error("yepCore_DotProduct_V64fV64f_S64f: error: ", status)
    dotproduct[1]
end

function log!(y::AbstractVector{Float64}, x::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Log_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Log_V64f_V64f: error: ", status)
    y
end

function exp!(y::AbstractVector{Float64}, x::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Exp_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Exp_V64f_V64f: error: ", status)
    y
end

function sin!(y::AbstractVector{Float64}, x::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Sin_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Sin_V64f_V64f: error: ", status)
    y
end

function cos!(y::AbstractVector{Float64}, x::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Cos_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Cos_V64f_V64f: error: ", status)
    y
end

function tan!(y::AbstractVector{Float64}, x::AbstractVector{Float64})
    assert(length(x) == length(y))
    n = length(x)
    const status = ccall( (:yepMath_Tan_V64f_V64f, "libyeppp"), Int32, (Ptr{Float64}, Ptr{Float64}, Uint), x, y, n)
    status != 0 && error("yepMath_Tan_V64f_V64f: error: ", status)
    y
end

end # module
