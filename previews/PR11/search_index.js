var documenterSearchIndex = {"docs":
[{"location":"#Firebase.jl-:-Julia-Firebase","page":"Home","title":"Firebase.jl : Julia Firebase","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Julia's Interface to Firebase REST API","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using Pkg\nPkg.clone(\"https://github.com/ashwani-rathee/Firebase.jl.git\")","category":"page"},{"location":"#TODO","page":"Home","title":"TODO","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Lot of work in these section:","category":"page"},{"location":"","page":"Home","title":"Home","text":"[ ] Firebase Authentication\n[ ] Cloud Firestore\n[ ] Realtime Database","category":"page"},{"location":"#Cloud-Firestore","page":"Home","title":"Cloud Firestore","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using Firestore\n\nFirestore.init(path_to_firestore_service_account_key_json)\n\nFirestore.get(collection_id,doc_id) # get single doc\nFirestore.get(collection_id) # get all docs in collection w/o sub_collections)\nFirestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2) # get doc in sub collection\nFirestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2,sub_collection_id_2) # get all docs in sub collection","category":"page"},{"location":"#Realtime-Database","page":"Home","title":"Realtime Database","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Initializing the realdb for the base url, reduces the effort later","category":"page"},{"location":"","page":"Home","title":"Home","text":"realdbinit(\"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app\")\nBase Url set:\"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app\"","category":"page"},{"location":"#GET-Reading-Data","page":"Home","title":"GET - Reading Data","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Data from your Realtime Database can be read by issuing an HTTP GET request to an endpoint. The following example demonstrates how you might retrieve a user's name that you had previously stored in Realtime Database.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> realdb_get(\"/firebase_test\")\nulia> realdb_get(\"/firebase_test\")\nFINAL URL: \"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test.json\"\nGET successful\nDict{String, Any} with 3 entries:\n  \"firebase_get\"  => Dict{String, Any}(\"firebase_get_3\"=>3, \"firebase_get_2\"=>2, \"firebase_get_1\"=>1)\n  \"firebase_new\"  => Dict{String, Any}(\"-McEjFxupzSbZwojItzL\"=>Dict{String, Any}(\"name\"=>\"real_db_test\"), \"-McEjCHubimhfipKm2yo\"=>Dict{String, Any}(\"name\"=>\"real_db_test\"), \"-McEjNy8-8VjqSH3P8dO\"=>Dict{String, Any}…\n  \"firebase_post\" => Dict{String, Any}(\"firebase_post_1\"=>1, \"firebase_post_3\"=>3, \"firebase_post_2\"=>2, \"input\"=>Dict{String, Any}(\"-McEQ7vGcvji7Myab182\"=>Dict{String, Any}(\"stockAmount\"=>350, \"price\"=>\"7.5 TL\", \"…\n","category":"page"},{"location":"#POST-Pushing-Data","page":"Home","title":"POST - Pushing Data","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"To accomplish the equivalent of the JavaScript push() method (see Lists of Data), you can issue a POST request. A successful request is indicated by a 200 OK HTTP status code. The response contains the child name of the new data specified in the POST request.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> realdb_post(\"/firebase_test/firebase_new\")\nFINAL URL: \"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json\"\nPOST successful\nDict{String, Any} with 1 entry:\n  \"name\" => \"-McEkk8qvdT4UHSUQALx\"\n\njulia> realdb_post(\"/firebase_test/firebase_new/\",\"\"\"{\"hello\":1}\"\"\")\nFINAL URL: \"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json\"\nPOST successful\nDict{String, Any} with 1 entry:\n  \"name\" => \"-McElRx3ZBP-l7pCF0LN\"","category":"page"},{"location":"#DELETE-Removing-Data","page":"Home","title":"DELETE - Removing Data","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"You can delete data with a DELETE request A successful DELETE request is indicated by a 200 OK HTTP status code with a response containing JSON null.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> realdb_delete(\"/firebase_test/firebase_new\")\nhttps://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json\nDELETE successful","category":"page"},{"location":"#PUT-Writing-Data","page":"Home","title":"PUT - Writing Data","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"You can write data with a PUT request. A successful request is indicated by a 200 OK HTTP status code. The response contains the data specified in the PUT request.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> realdb_put(\"/firebase_test/firebase_new/\",\"\"\"{\"hello\":1}\"\"\")\nFINAL URL: \"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json\"\nPUT successful\nDict{String, Any} with 1 entry:\n  \"name\" => \"-McElRx3ZBP-l7pCF0LN\"","category":"page"},{"location":"#Reference","page":"Home","title":"Reference","text":"","category":"section"}]
}