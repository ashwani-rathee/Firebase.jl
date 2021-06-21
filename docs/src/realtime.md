# Realtime Database


```@index
```
# Realtime Database

Initializing the realdb for the base url, reduces the effort later
```julia
realdbinit("https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app")
Base Url set:"https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app"
```

## GET - Reading Data
Data from your Realtime Database can be read by issuing an HTTP GET request to an endpoint. The following example demonstrates how you might retrieve a user's name that you had previously stored in Realtime Database.

```julia
julia> realdb_get("/firebase_test")
ulia> realdb_get("/firebase_test")
FINAL URL: "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test.json"
GET successful
Dict{String, Any} with 3 entries:
  "firebase_get"  => Dict{String, Any}("firebase_get_3"=>3, "firebase_get_2"=>2, "firebase_get_1"=>1)
  "firebase_new"  => Dict{String, Any}("-McEjFxupzSbZwojItzL"=>Dict{String, Any}("name"=>"real_db_test"), "-McEjCHubimhfipKm2yo"=>Dict{String, Any}("name"=>"real_db_test"), "-McEjNy8-8VjqSH3P8dO"=>Dict{String, Any}…
  "firebase_post" => Dict{String, Any}("firebase_post_1"=>1, "firebase_post_3"=>3, "firebase_post_2"=>2, "input"=>Dict{String, Any}("-McEQ7vGcvji7Myab182"=>Dict{String, Any}("stockAmount"=>350, "price"=>"7.5 TL", "…

```

## POST - Pushing Data
To accomplish the equivalent of the JavaScript push() method (see Lists of Data), you can issue a POST request.
A successful request is indicated by a 200 OK HTTP status code. The response contains the child name of the new data specified in the POST request.

```julia
julia> realdb_post("/firebase_test/firebase_new")
FINAL URL: "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json"
POST successful
Dict{String, Any} with 1 entry:
  "name" => "-McEkk8qvdT4UHSUQALx"

julia> realdb_post("/firebase_test/firebase_new/","""{"hello":1}""")
FINAL URL: "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json"
POST successful
Dict{String, Any} with 1 entry:
  "name" => "-McElRx3ZBP-l7pCF0LN"
```

## DELETE - Removing Data
You can delete data with a DELETE request
A successful DELETE request is indicated by a 200 OK HTTP status code with a response containing JSON null.

```julia
julia> realdb_delete("/firebase_test/firebase_new")
https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json
DELETE successful
```

## PUT - Writing Data
You can write data with a PUT request.
A successful request is indicated by a 200 OK HTTP status code. The response contains the data specified in the PUT request.

```julia
julia> realdb_put("/firebase_test/firebase_new/","""{"hello":1}""")
FINAL URL: "https://fir-jl-457eb-default-rtdb.asia-southeast1.firebasedatabase.app/firebase_test/firebase_new.json"
PUT successful
Dict{String, Any} with 1 entry:
  "name" => "-McElRx3ZBP-l7pCF0LN"
```

```@autodocs
Modules = [Firebase]
Pages   = ["realtime.jl"]
```