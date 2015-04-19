using Yeppp
using Base.Test

# write your own tests here
x = rand(1000)
y = rand(1000)
z = randn(1000)
res = rand(1000)

@test Yeppp.add!(res, x, y) == x .+ y
@test Yeppp.multiply!(res, x, y) == x .* y 
@test Yeppp.subtract!(res, x, y) == x .- y 
@test Yeppp.min!(res, x, y) == min(x, y)
@test Yeppp.max!(res, x, y) == max(x, y)

@test_approx_eq Yeppp.exp!(res, x) exp(x)
@test_approx_eq Yeppp.log!(res, x) log(x)
@test_approx_eq Yeppp.sin!(res, x) sin(x)
@test_approx_eq Yeppp.cos!(res, x) cos(x)
@test_approx_eq Yeppp.tan!(res, x) tan(x)

@test_approx_eq Yeppp.sum(x) sum(x)
@test_approx_eq Yeppp.sumabs(x) sumabs(x)
@test_approx_eq Yeppp.sumabs2(x) sumabs2(x)
