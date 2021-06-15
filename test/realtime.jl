using HTTP,JSON,Firebase
using Test

@testset "Realtime" begin

# Firebase Auth  backend a REST API

# Firebase.init("test/fir-jl-457eb-firebase-adminsdk-40928-0efd6a89e7.json");
# header = Dict(
#     "Authorization" =>
#         "Bearer ya29.c.Kp8BAwh19dsnHN7yPkhlb3toQleIQuAQ94YlV-aXs6ijDEvEKtvKmoNiXw9Fg7u-EjpHjusuu_k9nIaW7tFohhW97fPTx7G0KowT-R0nwI52XdvHrG-TrRAZOjC38eiu_eaPgXTh2wxHUDH-sVPpvA5Yzv8DgCoCRTUboxa3ajDVhRiyvM7uOiFcR27k6eoMrOmk_EBTabpODRLhtIeKG10O",
# );
# body = """
# {
#   "provider": "anonymous",
#   "uid": "e8e345bd-ca8d-40c7-9dfd-3c1d5630bc14"
# }
# """
# # {
# #   "rules": {
# #     ".read": "auth == null",
# #     ".write": "auth == null"
# #   }
# # }
res = HTTP.get("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json")
data = res.status
string = JSON.parse(String(res.body))
test1 = Dict{String, Any}("firebase_get_3" => 3, "firebase_get_2" => 2, "firebase_get_1" => 1)
println(string)
@test data == 200 
@test string == test1

http_response = HTTP.get("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test.json")
res = JSON.parse(String(http_response.body))
expected = Dict{String, Any}("firebase_get" => Dict{String, Any}("firebase_get_3" => 3, "firebase_get_2" => 2, "firebase_get_1" => 1), "firebase_post" => Dict{String, Any}("firebase_post_1" => 1, "firebase_post_3" => 3, "firebase_post_2" => 2))
@test http_response.status == 200
@test res == expected
end