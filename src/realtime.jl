using HTTP,JSON,Firebase
# Firebase Auth  backend a REST API

Firebase.init("test/fir-jl-457eb-firebase-adminsdk-40928-0efd6a89e7.json");
header = Dict(
    "Authorization" =>
        "Bearer ya29.c.Kp8BAwh19dsnHN7yPkhlb3toQleIQuAQ94YlV-aXs6ijDEvEKtvKmoNiXw9Fg7u-EjpHjusuu_k9nIaW7tFohhW97fPTx7G0KowT-R0nwI52XdvHrG-TrRAZOjC38eiu_eaPgXTh2wxHUDH-sVPpvA5Yzv8DgCoCRTUboxa3ajDVhRiyvM7uOiFcR27k6eoMrOmk_EBTabpODRLhtIeKG10O",
);
body = """
{
  "provider": "anonymous",
  "uid": "e8e345bd-ca8d-40c7-9dfd-3c1d5630bc14"
}
"""
# {
#   "rules": {
#     ".read": "auth == null",
#     ".write": "auth == null"
#   }
# }
res = HTTP.get("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json")
data = res.status
string = JSON.parse(String(res.body))
