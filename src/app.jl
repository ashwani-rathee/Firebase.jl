
using JSON,HTTP 

headers = Dict(
        "Authorization" => "Bearer ya29.c.Kp8BAwgF0KeQOQfjS8M4YiZAj7o8WGmeNbRd3VrEw6TxgSvffqzsY6Of5rF9WSD0Cby-adWDmLp9P7SCV5KlGVRsYg7WcuZCtI_Hwg2v0e9WzkgOuLd4WFlTo4wIrlWIC-OS9e5d3xmXAB-NA0OXypOF5LkDjzNh5jWmBmmeBELj_pVgYzvJQ9AOw2n4i9_4TZGccN5JWg7llEHzO4F95yMH"
      )

function get(url)
    try
        response = HTTP.get(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

function post(url)
    try
       
        body = Dict{String,Any}(
            "fields"=> Dict("Name"=> Dict(
                "stringValue"=> "Freshpak Rooibos Tea 80Pk",
            )),
            "Description"=> Dict(
                "stringValue"=> "Enjoy a cup of Freshpak Rooibos your no 1 Rooibos tea.",
            ),
          )
        body ="""{
            "fields": {
              "Name": {
                "stringValue": "Freshpak Rooibos Tea 80Pk"
              },
              "Description": {
                "stringValue": "Enjoy a cup of Freshpak Rooibos your no 1 Rooibos tea."
              }
            }
          }"""
        @show body
        response = HTTP.post(url,headers,body)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

function delete(url)
    try
        response = HTTP.delete(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

# function push(path...; content ={"apple":1})

# end

# function set(path...; content ={"apple":1})

# end




#=

# SPECIFIC DOCUMENT CREATION WITH FIELDS AND BODY

headers = Dict(
        "Authorization" => "Bearer ya29.c.Kp8BAwgF0KeQOQfjS8M4YiZAj7o8WGmeNbRd3VrEw6TxgSvffqzsY6Of5rF9WSD0Cby-adWDmLp9P7SCV5KlGVRsYg7WcuZCtI_Hwg2v0e9WzkgOuLd4WFlTo4wIrlWIC-OS9e5d3xmXAB-NA0OXypOF5LkDjzNh5jWmBmmeBELj_pVgYzvJQ9AOw2n4i9_4TZGccN5JWg7llEHzO4F95yMH"
        )

function post(url)
    try
        body = Dict{String,Any}(
            "fields"=> Dict("Name"=> Dict(
                "stringValue"=> "Freshpak Rooibos Tea 80Pk",
            )),
            "Description"=> Dict(
                "stringValue"=> "Enjoy a cup of Freshpak Rooibos your no 1 Rooibos tea.",
            ),
            )
        body ="""{
            "fields": {
                "Name": {
                "stringValue": "Freshpak Rooibos Tea 80Pk"
                },
                "Description": {
                "stringValue": "Enjoy a cup of Freshpak Rooibos your no 1 Rooibos tea."
                }
            }
            }"""
        @show body
        response = HTTP.post(url,headers,body)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end
url = "https://firestore.googleapis.com/v1/projects/julian-875a2/databases/(default)/documents/Julian?documentId=60011569052052"
response = post(url)
println(response)

r = HTTP.request("POST", "https://firestore.googleapis.com/v1/projects/julian-875a2/databases/(default)/documents/Julian?documentId=324")
println(r.status)
println(String(r.body))
=#

#=
Specific Document Deletion test


=#


#=

# BATCH GET EXAMPLE

body = """
{
 "newTransaction": {
 },
 "documents": [
  "projects/julian-875a2/databases/(default)/documents/Julian/324",
  "projects/julian-875a2/databases/(default)/documents/Julian/Layer2"
 ]
}"""

r = HTTP.request("POST", "https://firestore.googleapis.com/v1beta1/projects/julian-875a2/databases/(default)/documents:batchGet",headers,body)
println(r.status)
println(String(r.body))

=#