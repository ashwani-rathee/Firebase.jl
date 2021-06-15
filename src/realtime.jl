using Base: final_shred!
using HTTP,JSON,Firebase
# Firebase Auth  backend a REST API

export readdbinit, readldb_get, realdb_post, realdb_delete, realdb_put

Firebase.init("test/fir-jl-457eb-firebase-adminsdk-40928-0efd6a89e7.json");

BASE_URL = nothing

function realdbinit(base_url)
    global BASE_URL = base_url
    println("Base Url set:", BASE_URL)
    # BASE_URL = "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/"
end

function realdb_get(url)
    # println(BASE_URL)
    # final_url = "$BASE_URL$url.json"
    # println(final_url)
    res = HTTP.get(final_url)
    if res.status == 200
        println("GET successful")
    else
        println("GET errored")
    end
    JSON.parse(String(res.body))
end

function realdb_post(url,body = """{"name": "real_db_test"}""")
    final_url = "$BASE_URL$url.json"
    println(final_url)
    res = HTTP.post(final_url,"" ,body)
    if res.status == 200
        println("POST successful")
    else
        println("POST errored")
    end
    JSON.parse(String(res.body))
end

function realdb_delete(url,body = """{"name": "real_db_test"}""")
    final_url = "$BASE_URL$url.json"
    println(final_url)
    res = HTTP.delete(final,"" ,body)
    if res.status == 200
        println("DELETE successful")
    else
        println("DELETE errored")
    end
    JSON.parse(String(res.body))
end

function realdb_put(url,body = """{"name": "real_db_test"}""")
    final_url = "$BASE_URL$url.json"
    println(final_url)
    res = HTTP.put(final,body)
    if res.status == 200
        println("PUT successful")
    else
        println("PUT errored")
    end
    JSON.parse(String(res.body))
end

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
# {
#   "rules": {
#     ".read": "auth == null",
#     ".write": "auth == null"
#   }
# }
# res = HTTP.get("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json")
# data = res.status
# string = JSON.parse(String(res.body))
# body =
# """
# {
#       "name": "Sutas Yarim Yagli Sut",
#       "orderAmount": 1220,
#       "price": "7.5 TL",
#       "stockAmount": 350,
#       "img": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.idagross.com%2Fsutas-yarim-yagli-sut-1-litre&psig=AOvVaw1xDw-JiAKzUQlZ33PwVI-K&ust=1595330986772000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiXppnd2-oCFQAAAAAdAAAAABAD",
#       "categoryId": "-MCfyFwdqEa0ZyXkN6Y0",
#       "supplierId": "-MCfyQ6D1f_wy8aIaQqs"
# }"""

# res = HTTP.post("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json","" ,body)
