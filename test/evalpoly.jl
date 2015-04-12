module test_evalpoly
using Yeppp

const c0 =    1.53270461724076346
const c1 =    1.45339856462100293
const c2 =    1.21078763026010761
const c3 =    1.46952786401453397
const c4 =    1.34249847863665017
const c5 =    0.75093174077762164
const c6 =    1.90239336671587562
const c7 =    1.62162053962810579
const c8 =    0.53312230473555923
const c9 =    1.76588453111778762
const c10 =   1.31215699612484679
const c11 =   1.49636144227257237
const c12 =   1.52170011054112963
const c13 =   0.83637497322280110
const c14 =   1.12764540941736043
const c15 =   0.65513628703807597
const c16 =   1.15879020877781906
const c17 =   1.98262901973751791
const c18 =   1.09134643523639479
const c19 =   1.92898634047221235
const c20 =   1.01233347751449659
const c21 =   1.89462732589369078
const c22 =   1.28216239080886344
const c23 =   1.78448898277094016
const c24 =   1.22382217182612910
const c25 =   1.23434674193555734
const c26 =   1.13914782832335501
const c27 =   0.73506235075797319
const c28 =   0.55461432517332724
const c29 =   1.51704871121967963
const c30 =   1.22430234239661516
const c31 =   1.55001237689160722
const c32 =   0.84197209952298114
const c33 =   1.59396169927319749
const c34 =   0.97067044414760438
const c35 =   0.99001960195021281
const c36 =   1.17887814292622884
const c37 =   0.58955609453835851
const c38 =   0.58145654861350322
const c39 =   1.32447212043555583
const c40 =   1.24673632882394241
const c41 =   1.24571828921765111
const c42 =   1.21901343493503215
const c43 =   1.89453941213996638
const c44 =   1.85561626872427416
const c45 =   1.13302165522004133
const c46 =   1.79145993815510725
const c47 =   1.59227069037095317
const c48 =   1.89104468672467114
const c49 =   1.78733894997070918
const c50 =   1.32648559107345081
const c51 =   1.68531055586072865
const c52 =   1.08980909640581993
const c53 =   1.34308207822154847
const c54 =   1.81689492849547059
const c55 =   1.38582137073988747
const c56 =   1.04974901183570510
const c57 =   1.14348742300966456
const c58 =   1.87597730040483323
const c59 =   0.62131555899466420
const c60 =   0.64710935668225787
const c61 =   1.49846610600978751
const c62 =   1.07834176789680957
const c63 =   1.69130785175832059
const c64 =   1.64547687732258793
const c65 =   1.02441150427208083
const c66 =   1.86129006037146541
const c67 =   0.98309038830424073
const c68 =   1.75444578237500969
const c69 =   1.08698336765112349
const c70 =   1.89455010772036759
const c71 =   0.65812118412299539
const c72 =   0.62102711487851459
const c73 =   1.69991208083436747
const c74 =   1.65467704495635767
const c75 =   1.69599459626992174
const c76 =   0.82365682103308750
const c77 =   1.71353437063595036
const c78 =   0.54992984722831769
const c79 =   0.54717367088443119
const c80 =   0.79915543248858154
const c81 =   1.70160318364006257
const c82 =   1.34441280175456970
const c83 =   0.79789486341474966
const c84 =   0.61517383020710754
const c85 =   0.55177400048576055
const c86 =   1.43229889543908696
const c87 =   1.60658663666266949
const c88 =   1.78861146369896090
const c89 =   1.05843250742401821
const c90 =   1.58481799048208832
const c91 =   1.70954313374718085
const c92 =   0.52590070195022226
const c93 =   0.92705074709607885
const c94 =   0.71442651832362455
const c95 =   1.14752795948077643
const c96 =   0.89860175106926404
const c97 =   0.76771198245570573
const c98 =   0.67059202034800746
const c99 =   0.53785922275590729
const c100 =  0.82098327929734880

const coeff = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,
               c11, c12, c13, c14, c15, c16, c17, c18, c19, c20,
               c21, c22, c23, c24, c25, c26, c27, c28, c29, c30,
               c31, c32, c33, c34, c35, c36, c37, c38, c39, c40,
               c41, c42, c43, c44, c45, c46, c47, c48, c49, c50,
               c51, c52, c53, c54, c55, c56, c57, c58, c59, c60,
               c61, c62, c63, c64, c65, c66, c67, c68, c69, c70,
               c71, c72, c73, c74, c75, c76, c77, c78, c79, c80,
               c81, c82, c83, c84, c85, c86, c87, c88, c89, c90,
               c91, c92, c93, c94, c95, c96, c97, c98, c99, c100]


function horner!(xv::Vector{Float64}, y::Vector{Float64})
    for i in 1:length(xv)
        x = xv[i]
        y[i] =  c0 + x * (c1 + x * (c2 + x * (c3 + x * (c4 + x * (c5 + x * (c6 + x * (c7 + x * (c8 + x * (c9 + x * (c10 + x * (c11 +
                              x * (c12 + x * (c13 + x * (c14 + x * (c15 + x * (c16 + x * (c17 + x * (c18 + x * (c19 + x * (c20 + x * (c21 +
                              x * (c22 + x * (c23 + x * (c24 + x * (c25 + x * (c26 + x * (c27 + x * (c28 + x * (c29 + x * (c30 + x * (c31 +
                              x * (c32 + x * (c33 + x * (c34 + x * (c35 + x * (c36 + x * (c37 + x * (c38 + x * (c39 + x * (c40 + x * (c41 +
                              x * (c42 + x * (c43 + x * (c44 + x * (c45 + x * (c46 + x * (c47 + x * (c48 + x * (c49 + x * (c50 + x * (c51 +
                              x * (c52 + x * (c53 + x * (c54 + x * (c55 + x * (c56 + x * (c57 + x * (c58 + x * (c59 + x * (c60 + x * (c61 +
                              x * (c62 + x * (c63 + x * (c64 + x * (c65 + x * (c66 + x * (c67 + x * (c68 + x * (c69 + x * (c70 + x * (c71 +
                              x * (c72 + x * (c73 + x * (c74 + x * (c75 + x * (c76 + x * (c77 + x * (c78 + x * (c79 + x * (c80 + x * (c81 +
                              x * (c82 + x * (c83 + x * (c84 + x * (c85 + x * (c86 + x * (c87 + x * (c88 + x * (c89 + x * (c90 + x * (c91 +
                              x * (c92 + x * (c93 + x * (c94 + x * (c95 + x * (c96 + x * (c97 + x * (c98 + x * (c99 + x * c100)
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    end
end

function horner_gen!(coef::Vector{Float64}, x::Vector{Float64}, y::Vector{Float64})
  n = length(x)
  ncoef = length(coef)
  for i in 1:n
    xc = x[i]
    sum = coef[ncoef]
    for k in (ncoef - 1):-1:1
      sum = coef[k] + xc * sum
    end
    y[i] = sum
  end
end

function runtest(n::Int = 10^7)
    x = linspace(0,1,n)
    y1 = zeros(n)
    y2 = zeros(n)
    y3 = zeros(n)

    tyeppp = @elapsed Yeppp.evalpoly!(y1, coeff, x)
    thorner = @elapsed horner!(x, y2)
    thorner2 = @elapsed horner_gen!(coeff, x, y3)

    @printf "Evalpoly test, size %d\n" n
    @printf "Yeppp time: %f. Error relative to horner_gen!: %e.\n" tyeppp sqrt(sumabs2(y3-y1))
    @printf "Explicit Horner method: %f. Error relative to horner_gen!: %e\n" thorner sqrt(sumabs2(y3-y1))
    @printf "General Horner method: %f\n" thorner2

end
runtest()

end
