# Firebase.jl : Julia Firebase
![](https://i.imgur.com/wQ8boAw.png)
| **Documentation** | **Build Status** | **Information** |
|:-:|:-:|:-:|
| [![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://ashwani-rathee.github.io/Firebase.jl/dev/) | [![Build Status](https://travis-ci.com/Xh4H/Discord.jl.svg?branch=master)](https://travis-ci.com/Xh4H/Discord.jl) | [![Discord](https://img.shields.io/badge/discord-join-7289da.svg)](https://discord.gg/5vAJyZsS) [![License](https://img.shields.io/github/license/Xh4H/Discord.jl.svg)](https://github.com/ashwani-rathee/Firebase.jl/blob/main/LICENSE) |

Firebase.jl is the solution for working with [Firebase](https://firebase.google.com/) with the [Julia programming language](https://julialang.org).

## Notes:
>Firebase isn't endorsing this project and hasn't built this project. So use it at your own discretion and risk. 

# Installation

Stable Version
```julia
# Enter ']' from the REPL to enter Pkg mode.
pkg> add Firebase
```

Dev Version
```julia
using Pkg
# Enter ']' from the REPL to enter Pkg mode.
pkg> add https://github.com/Xh4H/Discord.jl

```


# Cloud Firestore

To fetch a document
```julia
using Firebase

init("[FIREBASE_ADMIN_SDK].json")
res = get_request("/firebase_test/firebase_get") # document get
res = get_request("/firebase_test/firebase_get/firebase_get_collection") # collection fetch
```

To Update/Insert a document
```julia
init("[FIREBASE_ADMIN_SDK].json")
firestore_patch("/firebase_test/firebase_patch")
```

To get list of documents
```julia
init("[FIREBASE_ADMIN_SDK].json")
firestore_getdoclist("/firebase_test")
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
Dict{String, Any} with 3 entries
```

## POST - Pushing Data
To accomplish the equivalent of the JavaScript push() method (see Lists of Data), you can issue a POST request.
A successful request is indicated by a 200 OK HTTP status code. The response contains the child name of the new data specified in the POST request.

```julia
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

## Reference

For further examples, guides and reference please refer to the documentation linked above.

## Contributing

Pull requests are welcome!
In most cases, it will be helpful to discuss the change you would like to make on [Discord](https://discord.gg/5vAJyZsS) before diving in too deep.

## Credits

Thanks to below mentioned projects as I used them as reference:
- Josh Day's project:  https://github.com/joshday/Firestore.jl
- xximranxx's prokect: https://github.com/xximranxx/Firestore.jl
