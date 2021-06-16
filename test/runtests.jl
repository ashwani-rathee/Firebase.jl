using Firebase
using Test
using HTTP, JSON

global CREDENTIALS = ENV["CREDENTIALS"]
# headers = Dict(
#     "Authorization" =>
#         "Bearer ya29.c.Kp8BAwh19dsnHN7yPkhlb3toQleIQuAQ94YlV-aXs6ijDEvEKtvKmoNiXw9Fg7u-EjpHjusuu_k9nIaW7tFohhW97fPTx7G0KowT-R0nwI52XdvHrG-TrRAZOjC38eiu_eaPgXTh2wxHUDH-sVPpvA5Yzv8DgCoCRTUboxa3ajDVhRiyvM7uOiFcR27k6eoMrOmk_EBTabpODRLhtIeKG10O",
# );
headers = Dict(auth_header());

@testset "Firebase" begin
    include("get.jl")
    include("realtime.jl")
end
