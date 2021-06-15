# using HTTP,JSON,Firebase
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
    res = HTTP.get(
        "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json",
    )
    data = res.status
    string = JSON.parse(String(res.body))
    test1 = Dict{String,Any}(
        "firebase_get_3" => 3,
        "firebase_get_2" => 2,
        "firebase_get_1" => 1,
    )
    # println(string)
    @test data == 200
    @test string == test1

    http_response = HTTP.get(
        "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_get.json",
    )
    res = JSON.parse(String(http_response.body))
    expected = Dict{String,Any}(
        "firebase_get_3" => 3,
        "firebase_get_2" => 2,
        "firebase_get_1" => 1,
    )
    @test http_response.status == 200
    @test res == expected


    body = """
           {
                 "Name": "Sutas Yarim Yagli Sut",
                 "orderAmount": 1220,
                 "price": "7.5 TL",
                 "stockAmount": 350,
                 "img": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.idagross.com%2Fsutas-yarim-yagli-sut-1-litre&psig=AOvVaw1xDw-JiAKzUQlZ33PwVI-K&ust=1595330986772000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiXppnd2-oCFQAAAAAdAAAAABAD",
                 "categoryId": "-MCfyFwdqEa0ZyXkN6Y0",
                 "supplierId": "-MCfyQ6D1f_wy8aIaQqs"
           }"""
    res = HTTP.post(
        "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input.json",
        "",
        body,
    )
    string = JSON.parse(String(res.body))["name"]
    expected = HTTP.get(
        "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input/$(string).json",
    )
    resd = JSON.parse(String(body))
    expected = JSON.parse(String(expected.body))
    @test resd == expected
    # println(JSON.parse(String(expected.body)))
    # println(JSON.parse(String(res.body))["name"])

    res = HTTP.delete("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input/$(string).json","" ,body)

    # body = """
    #        {
    #              "Name": "Sutas",
    #              "orderAmount": 1220,
    #              "price": "7.5 TL",
    #              "stockAmount": 350,
    #              "img": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.idagross.com%2Fsutas-yarim-yagli-sut-1-litre&psig=AOvVaw1xDw-JiAKzUQlZ33PwVI-K&ust=1595330986772000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiXppnd2-oCFQAAAAAdAAAAABAD",
    #              "categoryId": "-MCfyFwdqEa0ZyXkN6Y0",
    #              "supplierId": "-MCfyQ6D1f_wy8aIaQqs"
    #        }"""
    # res = HTTP.post(
    #     "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input.json",
    #     "",
    #     body,
    # )
    # string = JSON.parse(String(res.body))["name"]
    # expected = HTTP.get(
    #     "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input/$(string).json",
    # )
    # res = HTTP.put("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_post/input/$(string).json",body)

end
