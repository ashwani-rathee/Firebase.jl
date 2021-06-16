using Firebase
using Test
using HTTP, JSON


@testset "Firebase" begin
    include("realtime.jl")
    include("firestore.jl")
    
end
