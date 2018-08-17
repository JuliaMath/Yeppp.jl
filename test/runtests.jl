using Yeppp
using Test
import LinearAlgebra

for T in (Float32, Float64)
    x::Vector{T} = rand(1000)
    y::Vector{T} = rand(1000)
    z::Vector{T} = randn(1000)
    res::Vector{T} = rand(1000)

    @test Yeppp.add!(res, x, y) == x .+ y
    @test Yeppp.multiply!(res, x, y) == x .* y
    @test Yeppp.subtract!(res, x, y) == x .- y
    @test Yeppp.multiply(x, y) == x .* y
    @test Yeppp.subtract(x, y) == x .- y
    @test Yeppp.min!(res, x, y) == min.(x, y)
    @test Yeppp.max!(res, x, y) == max.(x, y)
    @test Yeppp.min(x, y) == min.(x, y)
    @test Yeppp.max(x, y) == max.(x, y)

    @test Yeppp.sum(x) ≈ sum(x)
    @test Yeppp.sumabs2(x) ≈ sum(abs2, x)
    @test Yeppp.dot(x, y) ≈ LinearAlgebra.dot(x, y)

end

x = rand(1000)
y = rand(1000)
z = randn(1000)
res = rand(1000)

@test Yeppp.exp!(res, x) ≈ exp.(x)
@test Yeppp.log!(res, x) ≈ log.(x)
@test Yeppp.sin!(res, x) ≈ sin.(x)
@test Yeppp.cos!(res, x) ≈ cos.(x)
@test Yeppp.tan!(res, x) ≈ tan.(x)

@test Yeppp.sum(x) ≈ sum(x)
@test Yeppp.sumabs(x) ≈ sum(abs, x)
@test Yeppp.sumabs2(x) ≈ sum(abs2, x)
