using Firebase

@testset "Realtime" begin

    URL = "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app"
    BASE_URL =  "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app"
    realdb_init(URL);
    # init method test
    res = realdb_init(URL);
    @test BASE_URL == URL

    # GET method test
    realdb_init(URL);
    res = realdb_get("/firebase_test/firebase_get");
    expected =  Dict{String,Any}("first" => "ashwani", "last" => "rathee")
    @test res == expected

    # POST method test
    realdb_init(URL)
    body = Dict("first" => "ashwani", "last" => "rathee")
    res = realdb_post("/firebase_test/firebase_post/post_test", body)
    test_id = res["name"]
    res = realdb_get("/firebase_test/firebase_post/post_test/$test_id");
    expected =  Dict{String,Any}("first" => "ashwani", "last" => "rathee")
    @test res == expected
    realdb_delete("/firebase_test/firebase_post/post_test/$test_id")

    # PUT method test
    realdb_init(URL)
    body = Dict("first" => "ashwani")
    res = realdb_put("/firebase_test/firebase_put", body)
    res = realdb_get("/firebase_test/firebase_put");
    @test res == body
    body = Dict("first" => "ashwani", "last" => "rathee")
    realdb_put("/firebase_test/firebase_put", body)

    # PATCH method test
    realdb_init(URL)
    body = Dict("last" => "rathi")
    realdb_patch("/firebase_test/firebase_patch", body)
    res = realdb_get("/firebase_test/firebase_patch")
    expected = Dict("first" => "ashwani", "last" => "rathi")
    @test res == expected
    body = Dict("first" => "ashwani", "last" => "rathee")
    realdb_put("/firebase_test/firebase_patch", body)

    # DELETE method test 
    realdb_init(URL)
    realdb_delete("/firebase_test/firebase_delete")
    res = realdb_get("/firebase_test/firebase_delete")
    @test res === nothing
    body = Dict("first" => "ashwani", "last" => "rathee")
    realdb_put("/firebase_test/firebase_delete", body)
end
