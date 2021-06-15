# using Firebase, Test
# using HTTP, JSON

@testset "Firebase: GET" begin

    # using old functions
    res = Firebase.get("firebase_test", "firebase_get")
    expected = Dict{String,Any}(
        "firebase_get1" => "1",
        "firebase_get3" => "3",
        "__id__" => "firebase_get",
        "firebase_get2" => "2",
    )
    @test res == expected

    # BATCH GET EXAMPLE
    body = """
    {
    "newTransaction": {
    },
    "documents": [
    "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get",
    "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get?collectionID=firebase_get_level2",
    "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/firebase_get_level2/firebase_get_level2_1",
    ]
    }"""

    res = HTTP.request(
        "POST",
        "https://firestore.googleapis.com/v1beta1/projects/fir-jl-457eb/databases/(default)/documents:batchGet",
        headers,
        body,
    )
    test1 = Dict{String,Any}(
        "name" =>
            "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get",
        "fields" => Dict{String,Any}(
            "firebase_get1" => Dict{String,Any}("stringValue" => "1"),
            "firebase_get3" => Dict{String,Any}("stringValue" => "3"),
            "firebase_get2" => Dict{String,Any}("stringValue" => "2"),
        ),
        "createTime" => "2021-06-15T03:37:00.201709Z",
        "updateTime" => "2021-06-15T03:37:00.201709Z",
    )
    test2 = Dict{String,Any}(
        "name" =>
            "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/firebase_get_level2/firebase_get_level2_1",
        "fields" => Dict{String,Any}(
            "get_level2_3" => Dict{String,Any}("stringValue" => "3"),
            "get_level2_1" => Dict{String,Any}("stringValue" => "1"),
            "get_level2_2" => Dict{String,Any}("stringValue" => "2"),
        ),
        "createTime" => "2021-06-15T03:38:10.344593Z",
        "updateTime" => "2021-06-15T03:38:10.344593Z",
    )
    test3 = "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get?collectionID=firebase_get_level2"
    # println("Start")
    data = JSON.parse(String(res.body))
    # println(data)
    @test res.status == 200
    @test data[2]["found"] == test1
    @test data[3]["found"] == test2
    @test data[4]["missing"] == test3

    # Lists documents.

    expected = Dict{String,Any}(
        "documents" => Any[
            Dict{String,Any}(
                "name" =>
                    "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/firebase_get_level2/firebase_get_level2_1",
                "fields" => Dict{String,Any}(
                    "get_level2_3" => Dict{String,Any}("stringValue" => "3"),
                    "get_level2_1" => Dict{String,Any}("stringValue" => "1"),
                    "get_level2_2" => Dict{String,Any}("stringValue" => "2"),
                ),
                "createTime" => "2021-06-15T03:38:10.344593Z",
                "updateTime" => "2021-06-15T03:38:10.344593Z",
            ),
            Dict{String,Any}(
                "name" =>
                    "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/firebase_get_level2/firebase_get_level2_2",
                "fields" => Dict{String,Any}(
                    "get_level2_2_1" => Dict{String,Any}("stringValue" => "1"),
                    "get_level2_2_2" => Dict{String,Any}("stringValue" => "2"),
                ),
                "createTime" => "2021-06-15T04:49:18.282446Z",
                "updateTime" => "2021-06-15T04:49:18.282446Z",
            ),
        ],
    )
    res = HTTP.get(
        "https://firestore.googleapis.com/v1beta1/projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/firebase_get_level2",
        headers,
    )
    res = JSON.parse(String(res.body))
    @test res == expected

    #

    #= Batch Write

    Doesn't work
    body = """
    {
        "writes": [
          {
            "update": {
              "name": "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_post",
              "fields": {
                "post_1": {
                  "stringValue": "0657331995"
                }
              }
            },
          }
        ]
      }"""

    res = HTTP.request("POST", "https://firestore.googleapis.com/v1beta1/projects/fir-jl-457eb/databases:batchWrite",headers,body)
    # println("Start")
    data = JSON.parse(String(res.body));
    println(data)

    =#

    # create document

    res
    #

    # Get document
    # res = HTTP.get("https://firestore.googleapis.com/v1/projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get/",headers)
    # data = JSON.parse(String(res.body));
    # println(data)
    # expected = Dict{String, Any}("name" => "projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get", "fields" => Dict{String, Any}("firebase_get1" => Dict{String, Any}("stringValue" => "1"), "firebase_get3" => Dict{String, Any}("stringValue" => "3"), "firebase_get2" => Dict{String, Any}("stringValue" => "2")), "createTime" => "2021-06-15T03:37:00.201709Z", "updateTime" => "2021-06-15T03:37:00.201709Z")
    # @test res == expected
    #

    # Delete document
    # works just fine
    res = HTTP.delete(
        "https://firestore.googleapis.com/v1/projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_post/new/new1?currentDocument.exists=true",
        headers,
    )
    # data = JSON.parse(String(res.body));
    # println(data)
    @test res.status == 200
    #

    # Create Document
    body = """{
         "fields": {
           "test": {
             "stringValue": "1"
           }
         }
       }
       """
    res = HTTP.post(
        "https://firestore.googleapis.com/v1/projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_post/new?documentId=new1",
        headers,
        body,
    )
    @test res.status == 200
    #


    # Lists all the collection IDs underneath a document.
    pagesize = 300
    pagetoken = ""
    if !isempty(pagetoken)
        query["pageToken"] = pagetoken
    end
    query = Dict{String,Any}("pageSize" => pagesize, "pageToken" => pagetoken)
    res = HTTP.post(
        "https://firestore.googleapis.com/v1beta1/projects/fir-jl-457eb/databases/(default)/documents/firebase_test/firebase_get:listCollectionIds",
        headers;
        query = query,
    )
    expected = Dict{String,Any}("collectionIds" => Any["firebase_get_level2"])
    res = JSON.parse(String(res.body))
    @test res == expected

    # Gets the metadata and configuration for a Field.   
    res =HTTP.get("https://firestore.googleapis.com/v1/projects/fir-jl-457eb/databases/(default)/collectionGroups/firebase_test/fields/firebase_get1",headers)
    res = JSON.parse(String(res.body))
    expected = Dict{String, Any}("name" => "projects/fir-jl-457eb/databases/(default)/collectionGroups/firebase_test/fields/firebase_get1", "indexConfig" => Dict{String, Any}("indexes" => Any[Dict{String, Any}("fields" => Any[Dict{String, Any}("order" => "ASCENDING", "fieldPath" => "firebase_get1")], "queryScope" => "COLLECTION", "state" => "READY"), Dict{String, Any}("fields" => Any[Dict{String, Any}("order" => "DESCENDING", "fieldPath" => "firebase_get1")], "queryScope" => "COLLECTION", "state" => "READY"), Dict{String, Any}("fields" => Any[Dict{String, Any}("arrayConfig" => "CONTAINS", "fieldPath" => "firebase_get1")], "queryScope" => "COLLECTION", "state" => "READY")], "usesAncestorConfig" => true, "ancestorField" => "projects/fir-jl-457eb/databases/(default)/collectionGroups/__default__/fields/*"))
    @test res == expected
    #

    # projects.databases.collectionGroups.fields.list
    # not able to make it work

    #
end