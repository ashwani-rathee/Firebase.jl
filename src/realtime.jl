# Realtime related

# Firebase.init("test/fir-jl-457eb-firebase-adminsdk-40928-0efd6a89e7.json");

# BASE_URL = nothing
# BASE_URL = "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app"
function realdbinit(base_url; query = Dict())
    global BASE_URL = base_url
    println("Base Url set:", BASE_URL)
end
pagesize = 300
pagetoken = ""

"""


"""
function realdb_get(url; query = Dict())
    final_url = "$BASE_URL$url.json"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.get(final_url; query = query)
    if res.status == 200
        println("GET successful")
    else
        println("GET errored")
    end
    JSON.parse(String(res.body))
end
# realdb_get("/users/jack/name")

"""

"""
function realdb_post(url, body = """{"name": "real_db_test"}"""; query = Dict())
    final_url = "$BASE_URL$url.json"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.post(final_url, "", body; query = query)
    if res.status == 200
        println("POST successful")
    else
        println("POST errored")
    end
    JSON.parse(String(res.body))
end
# body ="""{"user_id" : "jack", "text" : "Ahoy!"}"""
# realdb_post("/message_list",body)

"""

"""
function realdb_patch(url, body = """{"name": "real_db_test"}"""; query = Dict())
    final_url = "$BASE_URL$url.json"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.patch(final_url, "", body; query = query)
    if res.status == 200
        println("PATCH successful")
    else
        println("PATCH errored")
    end
    JSON.parse(String(res.body))
end
# body ="""{"last":"Jones"}"""
# realdb_patch("/users/jack/name/",body)

"""


"""
function realdb_delete(url, body = """{"name": "real_db_test"}"""; query = Dict())
    final_url = "$BASE_URL$url.json"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.delete(final_url, "", body; query = query)
    if res.status == 200
        println("DELETE successful")
    else
        println("DELETE errored")
    end
    JSON.parse(String(res.body))
end
# realdb_delete("/users/jack/name/last")
"""

"""
function realdb_put(url, body = """{"name": "real_db_test"}"""; query = Dict())
    final_url = "$BASE_URL$url.json"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.put(final_url, "", body; query = query)
    if res.status == 200
        println("PUT successful")
    else
        println("PUT errored")
    end
    JSON.parse(String(res.body))
end
# body = """{ "first": "Ash", "last": "Sparrow" }"""
# println(typeof(body))
# realdb_put("/users/jack/name",body)

"""

"""
function readdb_download(url, filename = "$url"; query = Dict())
    final_url = "$BASE_URL$url.json?download=$filename.txt"
    println("FINAL URL:", final_url)
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.get(final_url; query = query)
    if res.status == 200
        println("GET successful")
    else
        println("GET errored")
    end
    JSON.parse(String(res.body))
end